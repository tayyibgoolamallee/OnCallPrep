# Supabase Troubleshooting Guide

## Problem: Can't See Columns in Table Editor

If you can't see `plan`, `subscription_status`, or `subscription_expires_at` columns in the Supabase Table Editor, the table might not have been created with all columns.

### Solution 1: Run the Fix SQL

1. Go to **Supabase Dashboard** → **SQL Editor**
2. Open the file `FIX_USER_PROFILES_TABLE.sql` from your project
3. Copy the entire contents
4. Paste into Supabase SQL Editor
5. Click **Run**

This will:
- Check what columns exist
- Add any missing columns
- **NOT delete any existing data**

### Solution 2: Check Table Structure

Run this query in SQL Editor to see what columns you have:

```sql
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'user_profiles'
ORDER BY ordinal_position;
```

## Problem: Warning About Deleting Data

If Supabase warns you about deleting data when editing the table:

- **If editing the TABLE STRUCTURE (adding/removing columns)**: This is normal. It's warning about schema changes, not your data.
- **If editing ROWS (your user data)**: You shouldn't see this warning. If you do, something is wrong.

**Safe approach**: Use SQL queries instead of the Table Editor for updates.

## Problem: Changes Don't Show on Website

If you update the table but nothing changes on your website:

1. **Clear browser cache**: Press `Cmd + Shift + R` (Mac) or `Ctrl + Shift + R` (Windows)
2. **Log out and log back in**: This refreshes your session
3. **Check the data**: Run this query to verify your profile:

```sql
SELECT * FROM user_profiles WHERE email = 'your-email@example.com';
```

4. **Check browser console**: Open browser DevTools (F12) and look for errors

## Easiest Way: Use SQL to Update Your Profile

Instead of using the Table Editor:

1. Go to **Supabase Dashboard** → **SQL Editor**
2. Open `UPDATE_MY_PROFILE.sql` from your project
3. **Replace `'your-email@example.com'` with your actual email**
4. Click **Run**
5. Log out and log back in to your website

This is the safest and most reliable method.

## Verify It Worked

After updating, check your profile:

```sql
SELECT 
    email,
    plan,
    subscription_status,
    subscription_expires_at
FROM user_profiles
WHERE email = 'your-email@example.com';
```

You should see:
- `plan` = `pro`
- `subscription_status` = `active`
- `subscription_expires_at` = a future date

## Still Having Issues?

1. Make sure you're logged in to the website
2. Check that your email in Supabase matches your login email
3. Try the `grant-pro.html` page method instead (it's easier!)
4. Check browser console for JavaScript errors

