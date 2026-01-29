#!/bin/bash
# NullSector - Linux Nuke Script
# Operator: GhostByte

TARGET_IP="85.111.76.66"
echo "[*] NullSector Bash-Engine Active. Target: $TARGET_IP"

# Geçici dosyaları ve logları temizle
find . -name "*.log" -type f -delete
find . -name "*.tmp" -type f -delete

echo "[+] GhostByte, Linux sector is clean. Logs neutralized."
