# User Profiles Table Structure Explanation

## Current Table Structure (What You Have)

Your table currently has:
- `id` (uuid) ✓
- `email` (text) ✓
- `first_name` (text)
- `last_name` (text)
- `training_stage` (text) - *This is extra, not used by code*
- `plan` (text) ✓
- `role` (text) ✓
- `created_at` (timestamp) ✓
- `updated_at` (timestamp) ✓

## What the Code Expects

The code expects:
- `id` (uuid) ✓
- `email` (text) ✓
- `full_name` (text) - *Missing - code uses this instead of first_name/last_name*
- `plan` (text) ✓
- `subscription_status` (text) - **MISSING - Required for pro features**
- `subscription_expires_at` (timestamp) - **MISSING - Required for pro features**
- `role` (text) ✓
- `created_at` (timestamp) ✓
- `updated_at` (timestamp) ✓

## The Problem

1. **Missing `subscription_status`** - The code checks this to determine if a user has pro access
2. **Missing `subscription_expires_at`** - The code checks this to see if a subscription has expired
3. **Missing `full_name`** - The code uses `full_name` instead of `first_name`/`last_name`
4. **Extra `training_stage`** - This is fine to keep, but the code doesn't use it

## The Solution

Run the migration script `MIGRATE_USER_PROFILES_TABLE.sql` in your Supabase SQL Editor. This will:

1. ✅ Add `subscription_status` column (defaults to 'inactive')
2. ✅ Add `subscription_expires_at` column
3. ✅ Add `full_name` column and populate it from `first_name` + `last_name`
4. ✅ Keep your existing `first_name`, `last_name`, and `training_stage` columns (won't delete them)
5. ✅ Add proper constraints to ensure data integrity

## After Migration

Your table will have:
- All the columns the code needs ✓
- All your existing columns preserved ✓
- Data migrated safely (first_name + last_name → full_name) ✓

## How to Grant Pro Access

After running the migration, you can grant pro access using:

1. **Via SQL:**
```sql
UPDATE user_profiles 
SET plan = 'pro', 
    subscription_status = 'active',
    subscription_expires_at = NOW() + INTERVAL '1 year'
WHERE email = 'your-email@example.com';
```

2. **Via the grant-pro.html page** (if you have it set up)

3. **Via the admin panel** (if you have admin access)

## Notes

- The migration is **safe** - it won't delete any existing data
- `first_name` and `last_name` are kept in case you want to use them later
- `training_stage` is kept in case you want to use it for future features
- The code will now work properly with pro features!

