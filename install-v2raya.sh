#!/bin/bash

set -e

VERSION="2.5.8"
URL="https://github.com/v2rayA/v2rayA/releases/download/v${VERSION}/installer_debian_x64_${VERSION}.deb"
FILE="/tmp/v2raya_${VERSION}.deb"

echo
echo "=========================================="
echo "     V2RayA ${VERSION} - HiveOS Installer"
echo "=========================================="
echo

# ------------------------------------------
# Root check
# ------------------------------------------

if [ "$(id -u)" -ne 0 ]; then
    echo "[ERROR] Run this script as root."
    echo
    echo "Use:"
    echo "sudo -i"
    echo "then run the script again."
    exit 1
fi

echo "[OK] Running as root"

# ------------------------------------------
# Architecture check
# ------------------------------------------

ARCH=$(dpkg --print-architecture)

if [ "$ARCH" != "amd64" ]; then
    echo "[ERROR] This script requires amd64/x86_64."
    echo "Detected: $ARCH"
    exit 1
fi

echo "[OK] Architecture: amd64"

# ------------------------------------------
# Update repositories
# ------------------------------------------

echo
echo "[1/7] Updating APT..."

apt-get update

# ------------------------------------------
# Install required dependencies
# ------------------------------------------

echo
echo "[2/7] Installing dependencies..."

apt-get install -y \
    ca-certificates \
    curl \
    wget \
    iproute2 \
    iptables \
    nftables

echo "[OK] Dependencies installed"

# ------------------------------------------
# Download V2RayA
# ------------------------------------------

echo
echo "[3/7] Downloading V2RayA ${VERSION}..."

rm -f "$FILE"

wget \
    --progress=bar:force \
    -O "$FILE" \
    "$URL"

if [ ! -s "$FILE" ]; then
    echo
    echo "[ERROR] V2RayA package download failed."
    exit 1
fi

echo "[OK] Package downloaded"

# ------------------------------------------
# Install package
# ------------------------------------------

echo
echo "[4/7] Installing V2RayA..."

apt-get install -y "$FILE"

echo "[OK] V2RayA installed"

# ------------------------------------------
# Fix dependencies
# ------------------------------------------

echo
echo "[5/7] Checking dependencies..."

apt-get install -f -y

# ------------------------------------------
# Enable and start service
# ------------------------------------------

echo
echo "[6/7] Starting V2RayA..."

systemctl daemon-reload

systemctl enable v2raya.service

systemctl restart v2raya.service

sleep 3

# ------------------------------------------
# Verify service
# ------------------------------------------

echo
echo "[7/7] Checking service..."

if systemctl is-active --quiet v2raya.service; then
    echo "[OK] V2RayA is running"
else
    echo "[ERROR] V2RayA failed to start"
    echo
    systemctl status v2raya.service --no-pager
    echo
    echo "Last logs:"
    journalctl -u v2raya.service -n 50 --no-pager
    exit 1
fi

# ------------------------------------------
# Version information
# ------------------------------------------

echo
echo "=========================================="
echo "             Installation OK"
echo "=========================================="
echo

echo "V2RayA service:"
systemctl is-active v2raya.service

echo
echo "Installed package:"
dpkg -s v2raya 2>/dev/null | grep -E "Package:|Version:" || true

echo
echo "Listening ports:"
ss -lntp 2>/dev/null | grep -E ':2017|v2raya' || true

echo
echo "=========================================="
echo " Web Panel"
echo "=========================================="
echo

IP=$(hostname -I | awk '{print $1}')

echo "http://${IP}:2017"

echo
echo "Service status:"
echo "systemctl status v2raya --no-pager"

echo
echo "Live logs:"
echo "journalctl -u v2raya -f"

echo
echo "=========================================="
echo "       V2RayA installation finished"
echo "=========================================="
echo

# Cleanup
rm -f "$FILE"
