#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

# 修改openwrt登陆地址,把下面的192.168.12.1修改成你想要的就可以了
sed -i 's/192.168.1.1/192.168.12.1/g' package/base-files/files/bin/config_generate
	
	# 修改主机名字，把OpenWrt-123修改你喜欢的就行（不能纯数字或者使用中文）
	#sed -i '/uci commit system/i\uci set system.@system[0].hostname='Shaoyou11' package/lean/default-settings/files/zzz-default-settings
	
	# 版本号里显示一个自己的名字（281677160 build $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）
sed -i "s/OpenWrt /Shaoyou11 build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings
	
	# 修改 argon 为默认主题,可根据你喜欢的修改成其他的（不选择那些会自动改变为默认主题的主题才有效果）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
	
	# 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings
	
# Update Luci theme argon  
rm -rf package/lean/luci-theme-argon  
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon

git clone https://github.com/yangsongli/luci-theme-atmaterial package/luci-theme-atmaterial
git clone https://github.com/frainzy1477/luci-app-clash package/luci-app-clash
git clone https://github.com/tty228/luci-app-serverchan package/luci-app-serverchan

mkdir -p package/lean/smartdns && wget -P package/lean/smartdns https://raw.githubusercontent.com/pymumu/openwrt-smartdns/master/Makefile
git clone https://github.com/shaoyou11/luci-app-smartdns.git package/lean/luci-app-smartdns

git clone https://github.com/jerrykuku/node-request.git package/lean/node-request
git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git  package/lean/luci-app-jd-dailybonus
