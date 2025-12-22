# How to Add DNS Records for Your Domain

## 🎯 What You Need to Do

Vercel is showing "invalid configuration" because your domain registrar doesn't know to point to Vercel yet. You need to add DNS records at your domain registrar.

---

## 📋 Step 1: Get the DNS Records from Vercel

1. **Go to Vercel Dashboard:**
   - Visit [vercel.com](https://vercel.com)
   - Log in
   - Click on your **OnCallPrep project**

2. **Open Domain Settings:**
   - Click **"Settings"** tab
   - Click **"Domains"** in the left sidebar
   - Find `oncallprep.com` in the list

3. **See what Vercel wants:**
   - You should see something like:
     ```
     Configuration: Invalid
     
     Add these DNS records:
     
     Type: A
     Name: @
     Value: 76.76.21.21
     
     Type: CNAME
     Name: www
     Value: cname.vercel-dns.com
     ```

**Write down these values!** You'll need them in the next step.

---

## 🔧 Step 2: Add DNS Records at Your Domain Registrar

**Where did you buy `oncallprep.com`?** (GoDaddy, Namecheap, Google Domains, Cloudflare, etc.)

### Option A: GoDaddy

1. **Log in to GoDaddy:**
   - Go to [godaddy.com](https://godaddy.com)
   - Log in

2. **Find DNS Management:**
   - Click **"My Products"** (top right)
   - Find `oncallprep.com` in your domains list
   - Click the **three dots (⋯)** next to your domain
   - Click **"DNS"** or **"Manage DNS"**

3. **Add the A Record:**
   - Scroll down to **"Records"** section
   - Click **"Add"** button
   - **Type:** Select `A`
   - **Name:** Enter `@` (or leave blank, or `oncallprep.com`)
   - **Value:** Enter the IP address from Vercel (e.g., `76.76.21.21`)
   - **TTL:** Leave as default (usually 600 or 3600)
   - Click **"Save"**

4. **Add the CNAME Record:**
   - Click **"Add"** again
   - **Type:** Select `CNAME`
   - **Name:** Enter `www`
   - **Value:** Enter the CNAME from Vercel (e.g., `cname.vercel-dns.com`)
   - **TTL:** Leave as default
   - Click **"Save"**

5. **Wait 5-10 minutes**, then check Vercel again

---

### Option B: Namecheap

1. **Log in to Namecheap:**
   - Go to [namecheap.com](https://namecheap.com)
   - Log in

2. **Find DNS Settings:**
   - Click **"Domain List"** (top menu)
   - Find `oncallprep.com`
   - Click **"Manage"** button

3. **Go to Advanced DNS:**
   - Click **"Advanced DNS"** tab

4. **Add the A Record:**
   - In **"Host Records"** section, click **"Add New Record"**
   - **Type:** Select `A Record`
   - **Host:** Enter `@`
   - **Value:** Enter the IP address from Vercel
   - **TTL:** Select `Automatic` or `30 min`
   - Click the **checkmark (✓)** to save

5. **Add the CNAME Record:**
   - Click **"Add New Record"** again
   - **Type:** Select `CNAME Record`
   - **Host:** Enter `www`
   - **Value:** Enter the CNAME from Vercel
   - **TTL:** Select `Automatic` or `30 min`
   - Click the **checkmark (✓)** to save

6. **Wait 5-10 minutes**, then check Vercel again

---

### Option C: Google Domains / Google Workspace

1. **Log in to Google Domains:**
   - Go to [domains.google.com](https://domains.google.com)
   - Log in

2. **Find DNS Settings:**
   - Click on `oncallprep.com` in your domain list
   - Click **"DNS"** in the left sidebar

3. **Add the A Record:**
   - Scroll to **"Custom resource records"** section
   - Click **"Add"**
   - **Name:** Enter `@`
   - **Type:** Select `A`
   - **Data:** Enter the IP address from Vercel
   - **TTL:** Leave as default
   - Click **"Add"**

4. **Add the CNAME Record:**
   - Click **"Add"** again
   - **Name:** Enter `www`
   - **Type:** Select `CNAME`
   - **Data:** Enter the CNAME from Vercel
   - **TTL:** Leave as default
   - Click **"Add"**

5. **Wait 5-10 minutes**, then check Vercel again

---

### Option D: Cloudflare

1. **Log in to Cloudflare:**
   - Go to [cloudflare.com](https://cloudflare.com)
   - Log in

2. **Select Your Domain:**
   - Click on `oncallprep.com` in your dashboard

3. **Go to DNS:**
   - Click **"DNS"** in the left sidebar

4. **Add the A Record:**
   - Click **"Add record"**
   - **Type:** Select `A`
   - **Name:** Enter `@` (or `oncallprep.com`)
   - **IPv4 address:** Enter the IP address from Vercel
   - **Proxy status:** Click the **gray cloud** (DNS only - important!)
   - **TTL:** Select `Auto`
   - Click **"Save"**

5. **Add the CNAME Record:**
   - Click **"Add record"** again
   - **Type:** Select `CNAME`
   - **Name:** Enter `www`
   - **Target:** Enter the CNAME from Vercel
   - **Proxy status:** Click the **gray cloud** (DNS only)
   - **TTL:** Select `Auto`
   - Click **"Save"**

6. **Wait 5-10 minutes**, then check Vercel again

**Important for Cloudflare:** Make sure the proxy status is **gray (DNS only)**, not orange (proxied). Orange can cause issues.

---

### Option E: Other Registrars (General Steps)

If your registrar isn't listed above:

1. **Log in to your domain registrar**
2. **Find DNS Management / DNS Settings / DNS Records**
   - Usually in: Domain Settings, Advanced Settings, or DNS Management
3. **Add the A Record:**
   - **Type:** A
   - **Name/Host:** `@` or blank or `oncallprep.com`
   - **Value/Points to:** The IP address from Vercel
   - **TTL:** Default (usually 3600)
4. **Add the CNAME Record:**
   - **Type:** CNAME
   - **Name/Host:** `www`
   - **Value/Points to:** The CNAME from Vercel
   - **TTL:** Default
5. **Save both records**
6. **Wait 5-10 minutes**

---

## ✅ Step 3: Verify It's Working

### Check in Vercel:

1. Go back to Vercel Dashboard → Settings → Domains
2. Find `oncallprep.com`
3. The status should change from:
   - 🟡 **"Invalid configuration"** → 
   - 🟡 **"Pending"** → 
   - 🟢 **"Valid"** ✅

**This can take 5 minutes to 2 hours** (usually 10-30 minutes).

### Check DNS Propagation:

You can check if DNS is working using:
- [dnschecker.org](https://dnschecker.org) - Enter `oncallprep.com` and check A record
- Or in terminal: `nslookup oncallprep.com`

---

## 🐛 Troubleshooting

### Still showing "Invalid configuration" after 30 minutes?

1. **Double-check the records:**
   - Make sure the IP address is exactly right (no spaces, no typos)
   - Make sure the CNAME value is exactly right
   - Make sure the Name/Host is correct (`@` for root, `www` for www)

2. **Check for conflicting records:**
   - Make sure you don't have duplicate A records
   - Make sure you don't have an old A record pointing somewhere else

3. **Wait longer:**
   - DNS can take up to 48 hours (but usually much faster)
   - Try again in 1-2 hours

### "Domain not found" or "DNS error"

- **Fix:** Make sure you saved the DNS records correctly
- Check that the records are showing in your registrar's DNS management page
- Wait a bit longer for DNS to propagate

### Vercel shows different records than expected

- **Fix:** Use exactly what Vercel shows in the Domains page
- Don't use generic examples - use your specific values

---

## 📝 Quick Checklist

- [ ] Got DNS records from Vercel (A record IP and CNAME value)
- [ ] Logged in to domain registrar
- [ ] Found DNS Management / DNS Settings
- [ ] Added A record with `@` as name and Vercel's IP as value
- [ ] Added CNAME record with `www` as name and Vercel's CNAME as value
- [ ] Saved both records
- [ ] Waited 10-30 minutes
- [ ] Checked Vercel dashboard - status should be "Valid" or "Pending"

---

## 🆘 Still Stuck?

**Tell me:**
1. **Which registrar did you buy the domain from?** (GoDaddy, Namecheap, etc.)
2. **What exactly does Vercel show?** (Copy the DNS records it wants)
3. **What do you see in your registrar's DNS page?** (Screenshot or description)

I can give you more specific help! 🚀

