#!/bin/sh
set -eu

# Repository-specific post-feed customization hook.
# Keep this intentionally small. Device/package choices belong in configs/*.config.

# Example:
# sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
