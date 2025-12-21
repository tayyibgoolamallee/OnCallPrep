# How to Complete Pro Subscription Setup

## Quick Steps

### Option 1: Using SQL (Recommended)

1. **Open Supabase SQL Editor**

2. **Run this SQL** (replace the email with your actual email):
```sql
-- Fix plan column default
ALTER TABLE user_profiles 
    ALTER COLUMN plan DROP DEFAULT;

ALTER TABLE user_profiles 
    ALTER COLUMN plan SET DEFAULT 'free';

-- Grant yourself pro access
UPDATE user_profiles 
SET 
    plan = 'pro',
    subscription_status = 'active',
    subscription_expires_at = NOW() + INTERVAL '1 year'
WHERE email = 'YOUR_EMAIL_HERE';
```

3. **Verify it worked:**
```sql
SELECT email, plan, subscription_status, subscription_expires_at
FROM user_profiles
WHERE email = 'YOUR_EMAIL_HERE';
```

You should see:
- `plan`: `pro`
- `subscription_status`: `active`
- `subscription_expires_at`: A date 1 year from now

### Option 2: Using the Grant Pro Page

If you have the `grant-pro.html` page set up:

1. Make sure you're logged in
2. Navigate to `grant-pro.html` in your browser
3. Click the "Grant Myself Pro Access" button
4. Refresh the page and check if pro features are unlocked

### Option 3: Using Admin Panel

If you have admin access:

1. Navigate to `admin.html`
2. Find your user in the list
3. Click "Grant Pro Access" or update the plan manually

## Troubleshooting

### If you don't know your email in the database:

Run this to see all users:
```sql
SELECT id, email, plan, subscription_status, role
FROM user_profiles
ORDER BY created_at DESC;
```

### If you want to grant pro to multiple users:

```sql
UPDATE user_profiles 
SET 
    plan = 'pro',
    subscription_status = 'active',
    subscription_expires_at = NOW() + INTERVAL '1 year'
WHERE email IN ('email1@example.com', 'email2@example.com');
```

### If you want to set a different expiration date:

```sql
UPDATE user_profiles 
SET 
    plan = 'pro',
    subscription_status = 'active',
    subscription_expires_at = '2025-12-31 23:59:59'::timestamp
WHERE email = 'YOUR_EMAIL_HERE';
```

## After Setup

1. **Log out and log back in** to your website (this refreshes your session)
2. **Check pro features** - they should now be unlocked
3. **Verify in browser console** - you can check:
   ```javascript
   // In browser console after logging in
   getUserSubscription().then(result => console.log(result));
   ```

## What Each Field Does

- **`plan`**: Must be `'pro'` for pro features
- **`subscription_status`**: Must be `'active'` for pro features
- **`subscription_expires_at`**: Optional - if set, subscription expires on this date

The code checks: `plan === 'pro' AND (subscription_status === 'active' OR subscription_expires_at is in the future)`

