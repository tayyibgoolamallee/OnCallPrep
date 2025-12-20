# Which SQL Script Should I Use?

## Option 1: SIMPLE_COMPLETE_SETUP.sql (RECOMMENDED - No Data Loss)

**Use this if:**
- You already have users in your database
- You want to keep existing data
- You just want to add missing columns

**What it does:**
- Creates table if it doesn't exist
- Adds missing columns without deleting data
- Sets up all policies and triggers
- Safe to run multiple times

**How to use:**
1. Copy entire contents of `SIMPLE_COMPLETE_SETUP.sql`
2. Paste into Supabase SQL Editor
3. Click Run
4. Done!

## Option 2: COMPLETE_USER_PROFILES_SETUP.sql (Full Rebuild)

**Use this if:**
- You don't have important data yet
- You want a clean start
- You're okay with losing existing user profiles

**What it does:**
- Has option to drop and recreate table (commented out by default)
- More detailed with comments
- Includes verification queries at the end

**How to use:**
1. Copy entire contents of `COMPLETE_USER_PROFILES_SETUP.sql`
2. Paste into Supabase SQL Editor
3. **IMPORTANT**: The DROP TABLE line is commented out - leave it that way unless you want to delete all data
4. Click Run
5. Done!

## Recommendation

**Start with `SIMPLE_COMPLETE_SETUP.sql`** - it's safer and won't lose any data.

## After Running Either Script

1. **Grant yourself admin access** (optional):
   ```sql
   UPDATE user_profiles
   SET role = 'admin'
   WHERE email = 'your-email@example.com';
   ```

2. **Grant yourself pro access**:
   ```sql
   UPDATE user_profiles
   SET 
       plan = 'pro',
       subscription_status = 'active',
       subscription_expires_at = NOW() + INTERVAL '1 year'
   WHERE email = 'your-email@example.com';
   ```

3. **Log out and log back in** to your website

4. **Clear browser cache**: `Cmd + Shift + R` (Mac) or `Ctrl + Shift + R` (Windows)

## Verify It Worked

Run this query to check your profile:

```sql
SELECT 
    email,
    plan,
    subscription_status,
    subscription_expires_at,
    role
FROM user_profiles
WHERE email = 'your-email@example.com';
```

You should see all columns populated!

