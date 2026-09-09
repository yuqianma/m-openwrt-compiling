#!/bin/sh
set -eu

# PassWall2 needs its LuCI feed and shared dependency packages.
# Keep passwall_packages pinned to the commit immediately before Xray 26.9.8:
# OpenWrt 25.12.5 ships Go 1.26.x, while Xray 26.9.8 requires Go >= 1.27.
# Xray 26.7.28 still targets Go 1.26.
TMP_FILE="$(mktemp)"
cat > "$TMP_FILE" <<'EOF'
src-git passwall_packages https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git^16d7de22b82fac93fea55f24a3420cd4b7e37c77
src-git passwall2 https://github.com/Openwrt-Passwall/openwrt-passwall2.git;main
EOF
cat feeds.conf.default >> "$TMP_FILE"
mv "$TMP_FILE" feeds.conf.default
