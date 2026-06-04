# 🔒 SnapLock — Instant File & Folder Encryption

**One-command AES-256 encryption for any file or folder. Zero dependencies.**

```bash
# Encrypt a file
./snaplock.sh secrets.txt          # → creates secrets.txt.snap

# Encrypt a folder
./snaplock.sh ./my_project         # → creates my_project.snap

# Decrypt back
./snaplock.sh --decrypt secrets.txt.snap   # → restores secrets.txt
```

## Features

- 🔐 AES-256-CBC encryption with PBKDF2 key derivation (100K iterations)
- 📁 Handles both single files and entire folders
- 🪶 Single bash script — zero dependencies (just `openssl`)
- 🎨 Color-coded output with progress indicators
- 🛡️ Password confirmation & minimum length enforcement

## Install & Run

```bash
git clone https://github.com/mayank-dev-15/snaplock.git
cd snaplock
chmod +x snaplock.sh
./snaplock.sh --help
```

## Platform

Linux / macOS / WSL — anywhere `openssl` is available.
