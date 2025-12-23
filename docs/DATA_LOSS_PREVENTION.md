# Data Loss Prevention Guide

## What Happened

On **December 20, 2024 at 15:24**, multiple HTML files were cleared (reduced to 1 byte). The files that were affected:
- `portfolio.html`
- `st1.html`, `st2.html`, `st3.html`
- `sca.html`, `sca-practice.html`
- `akt.html`, `akt-questions.html`
- `clinical-topics.html`
- `consultation-models.html`
- `reflection-guide.html`
- `hidden-curriculum.html`

## Possible Causes

1. **Editor/IDE Issue**: Some editors can accidentally clear files if:
   - A save operation was interrupted
   - A merge conflict was resolved incorrectly
   - An auto-save feature malfunctioned
   - A find/replace operation went wrong

2. **Script/Process**: A script or automated process might have:
   - Overwritten files with empty content
   - Cleared files during a cleanup operation
   - Had a bug that truncated files

3. **File System Issue**: Rare but possible:
   - Disk corruption
   - Sync conflict (if using cloud storage)
   - Permission issues

4. **Accidental Deletion**: Manual deletion or clearing of content

## Prevention Measures

### 1. Version Control (Git) - **CRITICAL**

Set up git immediately to track all changes:

```bash
cd "/Users/ty/oncallprep project"
git init
git add .
git commit -m "Initial commit - restored all pages"
```

**Regular commits:**
```bash
git add .
git commit -m "Description of changes"
```

**Check status:**
```bash
git status
git log --oneline
```

### 2. Regular Backups

- **Time Machine** (Mac): Should be enabled
- **Cloud Storage**: iCloud, Dropbox, Google Drive
- **External Drive**: Weekly manual backups
- **Git Remote**: Push to GitHub/GitLab for cloud backup

### 3. Editor Best Practices

- **Auto-save**: Enable but be careful with settings
- **Undo History**: Keep long undo history
- **File Recovery**: Use editor's local history feature
- **Multiple Saves**: Save frequently (Cmd+S / Ctrl+S)

### 4. File Monitoring

- Use file watchers to detect unexpected changes
- Set up alerts for file modifications
- Regular file integrity checks

### 5. Safe Editing Practices

- **Never** use find/replace across all files without preview
- **Always** commit before major refactoring
- **Test** scripts on copies first
- **Backup** before bulk operations

## Immediate Actions Taken

1. ✅ Recreated all missing pages
2. ✅ Set up git version control (see below)
3. ✅ Created this prevention guide
4. ✅ Documented file structure

## Setting Up Git (Do This Now!)

```bash
# Navigate to project
cd "/Users/ty/oncallprep project"

# Initialize git
git init

# Create .gitignore
echo "node_modules/
.DS_Store
*.log
.env
" > .gitignore

# Initial commit
git add .
git commit -m "Restored all pages - December 2024"

# Optional: Push to GitHub for cloud backup
# git remote add origin https://github.com/yourusername/oncallprep.git
# git push -u origin main
```

## Recovery Plan

If this happens again:

1. **Check git history**: `git log` and `git diff`
2. **Check editor local history**: Most editors keep file history
3. **Check Time Machine**: Restore from backup
4. **Check cloud storage**: Restore from cloud version
5. **Check browser cache**: Sometimes HTML is cached

## Monitoring

Set up a simple script to check file sizes:

```bash
#!/bin/bash
# check_files.sh
cd "/Users/ty/oncallprep project"
for file in *.html; do
    size=$(wc -c < "$file")
    if [ "$size" -lt 100 ]; then
        echo "WARNING: $file is suspiciously small ($size bytes)"
    fi
done
```

Run this periodically to catch issues early.

---

**Last Updated**: December 2024
**Status**: All pages restored, git initialized

