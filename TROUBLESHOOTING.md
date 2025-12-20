# Troubleshooting Authentication Issues

## Issue: "Cannot find variable signIn" Error

This has been fixed! The scripts now load in the correct order and functions are properly exposed.

## Issue: Supabase Key Format

If you're seeing errors about the Supabase key, here's how to find the correct one:

### Finding the Correct Anon Key

1. Go to your Supabase Dashboard
2. Navigate to **Settings** → **API**
3. Look for **Project API keys** section
4. You need the **`anon` `public`** key (NOT the `service_role` key)

### Key Format

The correct key should:
- Start with `eyJ...` (it's a JWT token)
- Be very long (hundreds of characters)
- Be labeled as "anon" or "public" (safe for client-side use)

**DO NOT USE:**
- ❌ Keys starting with `sb_publishable_` (this is a different format)
- ❌ The `service_role` key (this bypasses security!)
- ❌ The `secret` key

### If You Only See `sb_publishable_` Keys

If your Supabase dashboard only shows keys starting with `sb_publishable_`, you might need to:

1. Check if there's a toggle or dropdown to show "JWT" format keys
2. Look for an "anon" or "public" key specifically
3. Try using the `sb_publishable_` key anyway - newer Supabase versions might support it

## Testing Your Setup

1. **Open browser console** (F12 → Console tab)
2. **Load your login page**
3. **Check for these messages:**
   - ✅ "Supabase client initialized successfully" = Good!
   - ❌ "Supabase library not loaded" = Check script loading order
   - ❌ "Supabase client not initialized" = Check your API keys

4. **Try logging in** and watch the console for errors

## Common Errors and Solutions

### Error: "Invalid API key"
- **Solution:** Double-check you copied the entire key (they're very long)
- Make sure there are no extra spaces before/after the key
- Verify you're using the `anon` key, not `service_role`

### Error: "Failed to fetch" or Network errors
- **Solution:** Check your Supabase URL is correct
- Make sure your project is active (not paused)
- Check browser console Network tab for failed requests

### Error: "Email not confirmed"
- **Solution:** Go to Supabase Dashboard → Authentication → Users
- Find your user and click "Confirm" manually
- OR disable email confirmation in Authentication → Providers → Email

### Error: "User already registered"
- **Solution:** User exists but might not be confirmed
- Try logging in instead of signing up
- Or delete the user from Supabase dashboard and try again

## Quick Debug Checklist

- [ ] Supabase URL is correct (starts with `https://` and ends with `.supabase.co`)
- [ ] Anon key is correct (starts with `eyJ...` or try `sb_publishable_` format)
- [ ] Scripts are loading in order (check Network tab)
- [ ] Browser console shows "Supabase client initialized successfully"
- [ ] Database tables exist (run SQL from SUPABASE_SETUP.md)
- [ ] Site URL configured in Supabase dashboard

## Still Having Issues?

1. **Check browser console** - Look for red error messages
2. **Check Network tab** - See if requests are failing
3. **Verify Supabase project** - Make sure it's active and not paused
4. **Test with a simple script** - Try this in browser console:
   ```javascript
   console.log('Supabase client:', window.supabaseClient);
   console.log('SignIn function:', typeof signIn);
   ```

If both show correctly, the setup is working!

