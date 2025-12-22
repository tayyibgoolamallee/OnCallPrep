# How to Link Your Custom Domain (oncallprep.com) to Vercel

## 🎯 Overview

You want to use `oncallprep.com` instead of `your-site.vercel.app`. Here's how to do it.

---

## 📋 Prerequisites

1. ✅ Your site is deployed on Vercel
2. ✅ You own the domain `oncallprep.com`
3. ✅ You have access to your domain registrar (where you bought the domain)

---

## 🚀 Step-by-Step Guide

### Step 1: Add Domain in Vercel

1. **Go to Vercel Dashboard:**
   - Visit [vercel.com](https://vercel.com)
   - Log in
   - Click on your **OnCallPrep project**

2. **Open Domain Settings:**
   - Click **"Settings"** tab
   - Click **"Domains"** in the left sidebar

3. **Add Your Domain:**
   - Click **"Add"** or **"Add Domain"** button
   - Enter: `oncallprep.com`
   - Click **"Add"**

4. **Vercel will show you DNS records to add:**
   - You'll see something like:
     ```
     Type: A
     Name: @
     Value: 76.76.21.21
     
     Type: CNAME
     Name: www
     Value: cname.vercel-dns.com
     ```

---

### Step 2: Configure DNS at Your Domain Registrar

**Where you bought your domain** (GoDaddy, Namecheap, Google Domains, etc.):

1. **Log in to your domain registrar**
2. **Find DNS Management / DNS Settings**
3. **Add the records Vercel provided:**

   **For the root domain (`oncallprep.com`):**
   - **Type:** A
   - **Name/Host:** `@` (or leave blank, or `oncallprep.com`)
   - **Value/Points to:** The IP address Vercel gave you
   - **TTL:** 3600 (or default)

   **For www subdomain (`www.oncallprep.com`):**
   - **Type:** CNAME
   - **Name/Host:** `www`
   - **Value/Points to:** The CNAME value Vercel gave you (usually `cname.vercel-dns.com`)
   - **TTL:** 3600 (or default)

---

### Step 3: Wait for DNS Propagation

- **This can take 5 minutes to 48 hours** (usually 1-2 hours)
- Vercel will show the status:
  - 🟡 **Pending** = Still waiting
  - 🟢 **Valid** = Working!

**You can check status in Vercel Dashboard → Settings → Domains**

---

### Step 4: Update Supabase (If Needed)

**If you added your Vercel URL to Supabase earlier**, you might want to add your custom domain too:

1. Go to Supabase Dashboard
2. Settings → API (or Authentication)
3. Add `https://oncallprep.com` to:
   - Site URL, or
   - Additional Redirect URLs, or
   - Allowed URLs

**But honestly, try it first - it might work without this!**

---

## 🔍 Common Domain Registrars

### GoDaddy
1. Log in → My Products → Domains
2. Click your domain → DNS
3. Add records as shown above

### Namecheap
1. Log in → Domain List
2. Click "Manage" next to your domain
3. Go to "Advanced DNS" tab
4. Add records

### Google Domains
1. Log in → My domains
2. Click your domain
3. Go to "DNS" section
4. Add records

### Cloudflare
1. Log in → Select your domain
2. Go to "DNS" tab
3. Add records
4. **Important:** Make sure "Proxy status" is set to "DNS only" (gray cloud) for the A record

---

## ✅ Verify It's Working

1. **Wait 1-2 hours** after adding DNS records
2. **Visit:** `https://oncallprep.com`
3. **Your site should load!** 🎉

**If it doesn't work:**
- Check Vercel dashboard for domain status
- Verify DNS records are correct
- Wait a bit longer (DNS can be slow)

---

## 🔒 SSL Certificate (Automatic!)

**Good news:** Vercel automatically provides SSL certificates (HTTPS) for custom domains. You don't need to do anything - it just works!

---

## 🌐 Redirect www to Non-www (Optional)

If you want `www.oncallprep.com` to redirect to `oncallprep.com`:

1. In Vercel Dashboard → Settings → Domains
2. Find `www.oncallprep.com`
3. Click the three dots (⋯) → Configure
4. Enable "Redirect to apex domain"

---

## 🐛 Troubleshooting

### "Domain not verified" in Vercel
- **Fix:** Double-check DNS records are correct
- Make sure you added both A and CNAME records
- Wait longer (up to 48 hours)

### "Site not loading" after DNS setup
- **Fix:** 
  1. Check DNS records are correct
  2. Use a DNS checker tool: [dnschecker.org](https://dnschecker.org)
  3. Make sure you're using `https://` not `http://`

### "SSL certificate error"
- **Fix:** Wait 5-10 minutes after domain is verified. Vercel needs time to issue the certificate.

---

## 📝 Quick Checklist

- [ ] Added domain in Vercel Dashboard
- [ ] Added A record at domain registrar
- [ ] Added CNAME record for www
- [ ] Waited for DNS propagation (1-2 hours)
- [ ] Verified domain shows "Valid" in Vercel
- [ ] Tested `https://oncallprep.com` in browser
- [ ] Updated Supabase URLs (if needed)

---

## 🎯 After Domain is Live

1. ✅ Test your site on the custom domain
2. ✅ Update any hardcoded URLs in your code (if any)
3. ✅ Share your site with the custom domain!

**That's it! Your site will be live at `oncallprep.com`** 🚀

