# How to Paste Your Token in Terminal

## 🔐 Important: The Token Won't Show!

When you paste your token, **it won't appear on screen** - this is normal! Terminal hides passwords and tokens for security. Even though you can't see it, it's being entered.

---

## 📋 Step-by-Step: Pasting Your Token

### Step 1: Git Will Ask for Username
When you run `git push -u origin main`, you'll see:
```
Username for 'https://github.com': 
```

**Type:** `tayyibgoolamallee`  
**Press:** Enter

---

### Step 2: Git Will Ask for Password
You'll see:
```
Password for 'https://tayyibgoolamallee@github.com': 
```

**This is where you paste your token!**

### How to Paste:
1. **Copy your token** (from GitHub - it starts with `ghp_`)
2. **Click in the Terminal window** (where it says "Password")
3. **Press:** `Cmd + V` (Command + V) to paste
   - **OR** Right-click and select "Paste"
4. **Even though nothing appears, your token is pasted!**
5. **Press:** Enter

---

## ✅ How to Know It Worked

If the token worked, you'll see:
```
Enumerating objects: XX, done.
Counting objects: 100% (XX/XX), done.
Writing objects: 100% (XX/XX), done.
To https://github.com/tayyibgoolamallee/OnCallPrep.git
 * [new branch]      main -> main
```

**If you see this, it worked!** 🎉

---

## ❌ If It Doesn't Work

### Error: "Authentication failed"
- Make sure you copied the **entire token** (it's long!)
- Check there are no extra spaces before/after
- Try copying it again from GitHub
- Make sure you selected `repo` permissions when creating it

### Error: "Permission denied"
- Your token might have expired
- Generate a new token and try again

### Nothing happens when you paste
- Try `Cmd + V` again
- Or right-click → Paste
- Make sure Terminal window is active (click on it first)

---

## 💡 Pro Tips

1. **Copy the token carefully:**
   - Make sure you get the whole thing
   - It should start with `ghp_` and be quite long

2. **Paste it all at once:**
   - Don't type it manually (too long and easy to make mistakes)
   - Use Cmd+V to paste

3. **If you're unsure if it pasted:**
   - Just press Enter anyway
   - If it's wrong, you'll get an error and can try again

4. **Save your token somewhere:**
   - You might need it again
   - Save it in a password manager or notes app

---

## 🎯 Quick Checklist

- [ ] Copied the entire token from GitHub
- [ ] Ran `git push -u origin main`
- [ ] Entered username: `tayyibgoolamallee`
- [ ] Pasted token (even though it doesn't show)
- [ ] Pressed Enter
- [ ] Saw success message

---

## 🆘 Still Having Trouble?

If you're still stuck:

1. **Try this alternative method:**
   - Instead of pasting, you can set the token as an environment variable
   - But pasting is usually easier!

2. **Check your token:**
   - Go back to GitHub → Settings → Developer settings → Personal access tokens
   - Make sure it's still there and active
   - If not, create a new one

3. **Try SSH instead:**
   - If HTTPS keeps failing, you can set up SSH keys (takes longer but more reliable)

---

**Remember: The token not showing is NORMAL - just paste it and press Enter!** 🔐

