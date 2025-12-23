# How to Add Your Vercel URL to Supabase

## 🔍 Finding the Right Setting

The setting might be in different places depending on your Supabase version. Here are all the places to check:

---

## 📍 Method 1: API Settings (Most Common)

1. **Go to Supabase Dashboard:**
   - Visit: [app.supabase.com](https://app.supabase.com)
   - Select your project

2. **Navigate to API Settings:**
   - Click **"Settings"** (gear icon in left sidebar)
   - Click **"API"** (under Project Settings)

3. **Look for one of these:**
   - **"Site URL"** - Add your Vercel URL here
   - **"Additional Redirect URLs"** - Add your Vercel URL here
   - **"Allowed URLs"** or **"CORS Allowed Origins"** - Add your Vercel URL here
   - **"API URL"** section - Look for CORS settings nearby

4. **If you see "Site URL":**
   - This is the main one
   - Add: `https://your-site.vercel.app`
   - Click "Save"

---

## 📍 Method 2: Authentication Settings

1. **Go to Settings → Authentication**
2. **Look for:**
   - **"Site URL"**
   - **"Redirect URLs"**
   - **"Additional Redirect URLs"**

3. **Add your Vercel URL:**
   - Format: `https://your-site.vercel.app`
   - Click "Save"

---

## 📍 Method 3: Project URL Settings

1. **Go to Settings → General**
2. **Look for:**
   - **"Reference ID"** section
   - **"Project URL"** or **"API URL"**
   - Any CORS-related settings

---

## 🎯 What to Add

**Your Vercel URL will look like one of these:**
- `https://oncallprep-xxxxx.vercel.app` (auto-generated)
- `https://oncallprep.vercel.app` (if you set a custom name)

**Add the full URL including `https://`**

---

## 🔍 If You Still Can't Find It

### Option A: It Might Not Be Needed!
- **Try your site first** - it might work without this setting
- Some Supabase projects don't require it
- Test login on your live site - if it works, you're good!

### Option B: Check Supabase Documentation
- The interface changes sometimes
- Search: "Supabase CORS settings" or "Supabase allowed URLs"
- Or check: [supabase.com/docs](https://supabase.com/docs)

### Option C: Use SQL (Advanced)
If you have access to SQL Editor:
```sql
-- This might work, but usually not needed
ALTER DATABASE postgres SET app.settings.cors_origins = 'https://your-site.vercel.app';
```

**But honestly, try your site first - it might just work!**

---

## ✅ Quick Test

**Before worrying about this setting:**

1. **Deploy to Vercel** (if you haven't already)
2. **Get your Vercel URL**
3. **Visit your live site**
4. **Try to log in**
5. **Check browser console (F12)** for errors

**If login works, you don't need to change anything!**

**If you get CORS errors, then we need to find the setting.**

---

## 🆘 Common Issues

### "I don't see any URL settings"
- **Try your site first** - it might work anyway
- The setting might be automatic in newer Supabase versions
- Check if your site works before worrying

### "I see 'Site URL' but it's already filled"
- That's fine - you can add your Vercel URL to "Additional Redirect URLs"
- Or change the Site URL to your Vercel URL

### "I get CORS errors"
- Make sure you're using `https://` not `http://`
- Check the URL is exactly right (no typos)
- Try clearing browser cache

---

## 💡 Pro Tip

**The easiest way:**
1. Deploy to Vercel
2. Test your site
3. If it works, you're done!
4. If you get errors, then we'll find the setting

**Don't overthink it - try it first!** 🚀

---

## 📸 What to Look For

In Supabase Settings → API, you might see:

```
API Settings
├── Project URL: https://xxxxx.supabase.co
├── anon key: xxxxx
├── service_role key: xxxxx
└── Site URL: [Add your Vercel URL here]
    └── Additional Redirect URLs: [Add here if Site URL exists]
```

Or in Authentication settings:

```
Authentication
├── Site URL: [Add here]
└── Redirect URLs: [Add here]
```

---

**TL;DR: Try your site first - it might work without any changes! If you get CORS errors, then we'll find the setting together.** ✅


