# Vercel Configuration Guide

## ✅ Root Directory: Leave as Default

**Answer: NO, don't change it!**

- **Root Directory:** Leave as `./` (default)
- This is correct because all your files are in the root of your repository
- Your HTML files, scripts, styles are all at the top level
- **Don't change this!**

---

## 🔧 Environment Variables: Optional for MVP

**Answer: You DON'T need them for MVP, but it's better to add them later**

### Current Situation:
Your Supabase credentials are in `scripts/config.js`:
```javascript
const SUPABASE_CONFIG = {
    url: 'https://yzdnyvkijztevppdecub.supabase.co',
    anonKey: 'sb_publishable_Fm0gAah8dnW6aAXXgglXGA_U8hl2yiX'
};
```

### For MVP (Simplest):
- **You can leave it as is** - it will work fine
- The anon key is meant to be public (it's in your HTML/JS anyway)
- RLS policies protect your data
- **Just deploy and it will work!**

### For Production (Better Practice):
Later, you can move to environment variables for better security:

1. **Update `scripts/config.js`:**
```javascript
const SUPABASE_CONFIG = {
    url: window.SUPABASE_URL || 'https://yzdnyvkijztevppdecub.supabase.co',
    anonKey: window.SUPABASE_ANON_KEY || 'sb_publishable_Fm0gAah8dnW6aAXXgglXGA_U8hl2yiX'
};
```

2. **Add to Vercel:**
   - Project Settings → Environment Variables
   - Add:
     - `SUPABASE_URL` = `https://yzdnyvkijztevppdecub.supabase.co`
     - `SUPABASE_ANON_KEY` = `sb_publishable_Fm0gAah8dnW6aAXXgglXGA_U8hl2yiX`

3. **Inject in HTML:**
   - Add to `index.html` before other scripts:
```html
<script>
  window.SUPABASE_URL = 'https://yzdnyvkijztevppdecub.supabase.co';
  window.SUPABASE_ANON_KEY = 'sb_publishable_Fm0gAah8dnW6aAXXgglXGA_U8hl2yiX';
</script>
```

**But honestly, for MVP, you don't need to do this!** Your current setup will work fine.

---

## 📋 Vercel Configuration Summary

### What to Set:

| Setting | Value | Why |
|---------|-------|-----|
| **Framework Preset** | `Other` | It's a static site, not a framework |
| **Root Directory** | `./` (default) | All files are in root |
| **Build Command** | Leave **empty** | No build needed for static site |
| **Output Directory** | Leave **empty** | Default is correct |
| **Install Command** | Leave default | Doesn't matter (no dependencies) |
| **Environment Variables** | **Skip for now** | Not needed for MVP |

---

## 🎯 Recommended Vercel Settings

When you import your project, use these exact settings:

```
Framework Preset: Other
Root Directory: ./
Build Command: (empty)
Output Directory: (empty)
Install Command: npm install (default - doesn't matter)
Environment Variables: (none needed for MVP)
```

**That's it!** Click "Deploy" and you're done.

---

## 🔐 About Environment Variables

### Why You Don't Need Them Now:
1. **Supabase anon key is public by design** - it's meant to be in client-side code
2. **RLS policies protect your data** - the key alone can't access anything
3. **Your current setup works** - no need to complicate it
4. **You can add them later** - when you have time

### When You Would Need Them:
- If you had a **secret key** (you don't - you're using anon key)
- If you wanted to **hide credentials** (not necessary for anon key)
- If you had **different configs** for dev/prod (not needed yet)

---

## ✅ Quick Answer

**Root Directory:** Leave as `./` (default) ✅  
**Environment Variables:** Skip for now - not needed! ✅

**Just deploy with default settings and it will work!** 🚀

---

## 🎉 After Deployment

The only thing you MUST do after deployment:
1. **Add your Vercel URL to Supabase:**
   - Supabase Dashboard → Settings → API
   - Add: `https://your-site.vercel.app`
   - This allows your live site to connect to Supabase

That's the only configuration needed!

---

**TL;DR: Use default settings, skip environment variables for now, just deploy!** ✅


