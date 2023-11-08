#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# sed -i 's|PKG_VERSION:=0.*|PKG_VERSION:=0\.51\.3|g' feeds/packages/net/frp/Makefile
# sed -i 's|PKG_HASH:=.*|PKG_HASH:=83032399773901348c660d41c967530e794ab58172ccd070db89d5e50d915fef|g' feeds/packages/net/frp/Makefile
sed -i 's|PKG_BUILD_DEPENDS:=golang/host upx/host|PKG_BUILD_DEPENDS:=golang/host|g' feeds/packages/net/frp/Makefile
sed -i 's|$(STAGING_DIR_HOST)/bin/upx.*||g' feeds/packages/net/frp/Makefile

sed -i 's|LUCI_DEPENDS:=+wget|LUCI_DEPENDS:=+wget-ssl|g' feeds/luci/applications/luci-app-frpc/Makefile
sed -i 's|LUCI_DEPENDS:=+wget|LUCI_DEPENDS:=+wget-ssl|g' feeds/luci/applications/luci-app-frps/Makefile
