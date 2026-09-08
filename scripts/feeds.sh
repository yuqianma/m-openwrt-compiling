#!/bin/sh
set -eu

# PassWall2 needs its LuCI feed and shared dependency packages.
# Prepend them so these package definitions take precedence over similarly
# named packages from the stock OpenWrt feeds.
TMP_FILE="$(mktemp)"
cat > "$TMP_FILE" <<'EOF'
src-git passwall_packages https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git;main
src-git passwall2 https://github.com/Openwrt-Passwall/openwrt-passwall2.git;main
EOF
cat feeds.conf.default >> "$TMP_FILE"
mv "$TMP_FILE" feeds.conf.default
