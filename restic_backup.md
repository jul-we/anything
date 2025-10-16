# Backup with restic

Absolutely! Restic is a fast, secure, and efficient backup program that is especially popular for backing up data to local drives, remote servers, or cloud storage. It's cross-platform, open-source, and deduplicates data automatically.

Here’s a basic introduction to **restic** and the most essential commands you'll need to get started:

---

## 🧰 **Restic Basics**

### 📦 1. **Initialize a Repository**

Before backing up, you need to initialize a backup repository — a place where restic stores backup data.

#### Local repository:

```bash
restic init --repo /path/to/backup
```

#### Remote repository (e.g., over SSH):

```bash
restic -r sftp:user@host:/path/to/backup init
```

You'll be prompted to set a password — this is **required** to access backups.

---

### 🔐 2. **Export Password (Best Practice)**

Store your password in an environment variable so you don't have to type it every time:

```bash
export RESTIC_PASSWORD="yourpassword"
```

Alternatively, use a file:

```bash
export RESTIC_PASSWORD_FILE=/path/to/password.txt
```

---

### 💾 3. **Backup Files**

To back up a folder:

```bash
restic -r /path/to/backup backup /home/youruser/documents
```

You can back up multiple folders:

```bash
restic -r /path/to/backup backup /home/youruser/documents /etc /var/log
```

---

### 📂 4. **List Snapshots**

See all the backups (snapshots) you’ve made:

```bash
restic -r /path/to/backup snapshots
```

---

### 🔍 5. **Restore a Snapshot**

To restore a backup:

```bash
restic -r /path/to/backup restore <snapshotID> --target /restore/location
```

Example:

```bash
restic -r /path/to/backup restore latest --target /tmp/restore
```

---

### 🔍 6. **Browse Backup Contents**

To browse what's in a snapshot:

```bash
restic -r /path/to/backup ls latest
```

Or a specific snapshot ID:

```bash
restic -r /path/to/backup ls abcdef12
```

---

### 🧹 7. **Forget Old Snapshots + Cleanup**

To delete old backups:

```bash
restic -r /path/to/backup forget --keep-last 3
```

To **remove** unused data and free up space:

```bash
restic -r /path/to/backup prune
```

Often used together:

```bash
restic -r /path/to/backup forget --keep-last 3 --prune
```

---

### 🧪 8. **Check Repository for Errors**

Make sure everything is intact:

```bash
restic -r /path/to/backup check
```

---

### 📃 9. **Mount Backup (as a Filesystem)**

On Linux/macOS (with FUSE):

```bash
restic -r /path/to/backup mount /mnt/restic
```

---

## 🛠️ Example Use Case

```bash
export RESTIC_REPOSITORY="/mnt/backupdrive/restic"
export RESTIC_PASSWORD="MySecurePassword"

restic init
restic backup /home/username
restic snapshots
restic restore latest --target /tmp/restore
```

---

## Change Password

```bash
restic -r /path/to/repo key passwd
```
