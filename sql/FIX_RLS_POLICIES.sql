-- ============================================
-- FIX RLS POLICIES - Remove Infinite Recursion
-- ============================================
-- The admin policies were causing infinite recursion
-- This fixes them by using a security definer function

-- Step 1: Drop existing problematic policies
DROP POLICY IF EXISTS "Admins can view all profiles" ON user_profiles;
DROP POLICY IF EXISTS "Admins can update all profiles" ON user_profiles;
DROP POLICY IF EXISTS "Users can view own profile" ON user_profiles;
DROP POLICY IF EXISTS "Users can update own profile" ON user_profiles;
DROP POLICY IF EXISTS "Users can insert own profile" ON user_profiles;

-- Step 2: Create a security definer function to check admin status
-- This avoids recursion by checking auth.users directly
CREATE OR REPLACE FUNCTION public.is_admin(user_id UUID)
RETURNS BOOLEAN AS $$
BEGIN
    -- Check if user exists and has admin role in user_profiles
    -- Using security definer to bypass RLS
    RETURN EXISTS (
        SELECT 1 
        FROM public.user_profiles 
        WHERE id = user_id 
        AND role = 'admin'
    );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Step 3: Recreate user policies (simple, no recursion)
CREATE POLICY "Users can view own profile"
    ON user_profiles FOR SELECT
    USING (auth.uid() = id);

CREATE POLICY "Users can update own profile"
    ON user_profiles FOR UPDATE
    USING (auth.uid() = id)
    WITH CHECK (auth.uid() = id);

CREATE POLICY "Users can insert own profile"
    ON user_profiles FOR INSERT
    WITH CHECK (auth.uid() = id);

-- Step 4: Create admin policies using the function (avoids recursion)
CREATE POLICY "Admins can view all profiles"
    ON user_profiles FOR SELECT
    USING (public.is_admin(auth.uid()));

CREATE POLICY "Admins can update all profiles"
    ON user_profiles FOR UPDATE
    USING (public.is_admin(auth.uid()))
    WITH CHECK (public.is_admin(auth.uid()));

-- Step 5: Verify policies
SELECT 
    schemaname,
    tablename,
    policyname,
    permissive,
    roles,
    cmd,
    qual,
    with_check
FROM pg_policies
WHERE tablename = 'user_profiles'
ORDER BY policyname;

-- Note: The is_admin function uses SECURITY DEFINER which means it runs
-- with the privileges of the function creator (usually postgres), bypassing RLS
-- This prevents the infinite recursion issue


