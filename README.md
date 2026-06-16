# snaplock

[![Live Demo](https://img.shields.io/badge/🚀_Live_Demo-Visit-blue?style=for-the-badge)](https://mayank-dev-15.github.io/snaplock-demo)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Language](https://img.shields.io/badge/Language-Shell-green)

Instant file and folder encryption tool using AES-256 — zero external dependencies, single bash script.

`encryption` `security` `aes-256` `bash`

---

## ✨ Features

- AES-256-CBC encryption via OpenSSL
- Single bash script — zero dependencies
- Encrypt individual files or entire folders
- Password-protected with PBKDF2 key derivation
- Cross-platform (Linux, macOS, WSL)
- Simple command-line interface

---

## 🚀 Live Demo

**[View Demo →](https://mayank-dev-15.github.io/snaplock-demo)**

The demo is hosted on GitHub Pages. No installation needed — just click and explore.

---

## 🛠️ Tech Stack

- Bash
- OpenSSL
- AES-256-CBC
- PBKDF2

---

## 📦 Installation

```bash
git clone https://github.com/mayank-dev-15/snaplock.git
cd snaplock
```

```bash
cd snaplock
chmod +x snaplock.sh
# That's it — no dependencies to install
```

---

## 💡 Usage

```bash
# Encrypt a file
./snaplock.sh -e -i secret.txt -o secret.txt.enc

# Decrypt a file
./snaplock.sh -d -i secret.txt.enc -o secret.txt

# Encrypt a folder (creates .tar.gz.enc)
./snaplock.sh -e -i myfolder -o myfolder.enc

# Decrypt a folder
./snaplock.sh -d -i myfolder.enc -o myfolder
```

---

## 📁 Project Structure

```
snaplock/
├── README.md          # This file
├── Demo.md            # Demo documentation
├── LICENSE            # MIT License
└── ...                # Source files
```

---

## 🤝 Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request.

---

## 📄 License

This project is licensed under the MIT License.

---

## 🔗 Links

- **Live Demo:** [https://mayank-dev-15.github.io/snaplock-demo](https://mayank-dev-15.github.io/snaplock-demo)
- **Source Code:** [github.com/mayank-dev-15/snaplock](https://github.com/mayank-dev-15/snaplock)
- **Issues:** [github.com/mayank-dev-15/snaplock/issues](https://github.com/mayank-dev-15/snaplock/issues)
- **Releases:** [github.com/mayank-dev-15/snaplock/releases](https://github.com/mayank-dev-15/snaplock/releases)
- **Demo Docs:** [Demo.md](https://github.com/mayank-dev-15/snaplock/blob/main/Demo.md)

---

*Built with ❤️ by [Mayank Basena](https://github.com/mayank-dev-15) · 15 · GSoC 2027 Aspirant*

---

## ⚠️ Attribution & Credit Notice

This project is created and maintained by **Mayank Basena** ([@mayank-dev-15](https://github.com/mayank-dev-15)).

If you fork, use, modify, or derive work from this repository, **you must give proper credit** to the original author. This includes:

- Keeping this attribution section intact in any fork or derivative work
- Crediting **Mayank Basena** in your project's README or documentation
- Linking back to the original repository

**Failure to provide proper credit is a violation of the spirit of open source and may result in a DMCA takedown request.**

> *"No AI. No Shortcuts."* — Mayank Basena
