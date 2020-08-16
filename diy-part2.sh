#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

# Modify default IP
sed -i 's/192.168.1.1/192.168.12.1/g' package/base-files/files/bin/config_generate

# Update Luci theme argon  
rm -rf package/lean/luci-theme-argon  
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon

git clone https://github.com/yangsongli/luci-theme-atmaterial package/luci-theme-atmaterial
git clone https://github.com/frainzy1477/luci-app-clash package/luci-app-clash
git clone https://github.com/tty228/luci-app-serverchan package/luci-app-serverchan

mkdir -p package/lean/smartdns && wget -P package/lean/smartdns https://raw.githubusercontent.com/pymumu/openwrt-smartdns/master/Makefile
git clone https://github.com/shaoyou11/luci-app-smartdns.git package/lean/luci-app-smartdn

git clone https://github.com/jerrykuku/node-request.git
git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git  
