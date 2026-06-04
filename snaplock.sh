#!/bin/bash
# SnapLock - Instant file/folder encryption tool
# Usage: ./snaplock.sh <file_or_folder>     → encrypts to .snap
#        ./snaplock.sh --decrypt <file.snap> → decrypts back
# Single-file, zero-dependency, AES-256-CBC encryption for everyone.

set -euo pipefail

RED='\033[0;31m'; GREEN='\033[0;32m'; CYAN='\033[0;36m'; YELLOW='\033[1;33m'; NC='\033[0m'
error() { echo -e "${RED}✗ $1${NC}" >&2; exit 1; }
ok() { echo -e "${GREEN}✓ $1${NC}"; }
info() { echo -e "${CYAN}ℹ $1${NC}"; }

command -v openssl >/dev/null 2>&1 || error "openssl required: sudo apt install openssl"

TARGET="${1:-}"
DECRYPT=false
[[ "$TARGET" == "--decrypt" || "$TARGET" == "-d" ]] && { DECRYPT=true; TARGET="${2:-}"; }
[[ -z "$TARGET" ]] && { echo "Usage: $0 <file|folder> | $0 --decrypt <file.snap>"; exit 1; }
[[ -e "$TARGET" ]] || error "Not found: $TARGET"

if [[ "$DECRYPT" == true ]]; then
    [[ "$TARGET" == *.snap ]] || error "File must be .snap"
    OUTPUT="${TARGET%.snap}"
    [[ -e "$OUTPUT" ]] && { echo -n "Overwrite $OUTPUT? (y/N): "; read -r c; [[ "$c" == "y" ]] || exit 0; }
    echo -n "Password: "; read -rs PW; echo
    openssl enc -aes-256-cbc -d -pbkdf2 -iter 100000 -pass pass:"$PW" -in "$TARGET" -out "$OUTPUT" 2>/dev/null && ok "Decrypted → $OUTPUT" || error "Decryption failed"
else
    OUTPUT="${TARGET}.snap"
    [[ -e "$OUTPUT" ]] && { echo -n "Overwrite $OUTPUT? (y/N): "; read -r c; [[ "$c" == "y" ]] || exit 0; }
    echo -n "Password (8+ chars): "; read -rs PW1; echo
    echo -n "Confirm: "; read -rs PW2; echo
    [[ "$PW1" == "$PW2" ]] || error "Passwords don't match"
    [[ ${#PW1} -ge 8 ]] || error "Password too short"
    if [[ -d "$TARGET" ]]; then
        tar czf - "$TARGET" | openssl enc -aes-256-cbc -salt -pbkdf2 -iter 100000 -pass pass:"$PW1" -out "$OUTPUT"
    else
        openssl enc -aes-256-cbc -salt -pbkdf2 -iter 100000 -pass pass:"$PW1" -in "$TARGET" -out "$OUTPUT"
    fi
    ok "Encrypted → $OUTPUT ($(du -h "$OUTPUT" | cut -f1))"
fi
