#!/bin/bash

echo "Test custom.sh"

source ../version

rm -rf package/feeds/routing/olsrd/patches/012-gpsd.patch
rm -rf package/lean/default-settings/files/zzz-default-settings
wget https://raw.githubusercontent.com/coolsnowwolf/lede/99222f49fd9f63eef575ac34f251280e6e97f3b3/package/lean/default-settings/files/zzz-default-settings -O package/lean/default-settings/files/zzz-default-settings

sed -i '92d'                                                                   package/system/opkg/Makefile
sed -i '/shadow/d'                     package/lean/default-settings/files/zzz-default-settings
sed -i '/nas/d'                     package/lean/default-settings/files/zzz-default-settings
sed -i "s/openwrt.proxy.ustclug.org/openwrt.download/g"  package/lean/default-settings/files/zzz-default-settings
sed -i "s/https:/R20.0.0/g"  package/lean/default-settings/files/zzz-default-settings
sed -i  's/http:/snapshots/g'  package/lean/default-settings/files/zzz-default-settings
sed -i  " 23i sed -i 's/http:/https:/g' /etc/opkg/distfeeds.conf"  package/lean/default-settings/files/zzz-default-settings
sed -i  "s/R20\(.[0-9].[0-9]\{1,2\}\)/R20.$version/g" package/lean/default-settings/files/zzz-default-settings
sed -i 's/DEPENDS.*/& \+luci-i18n-samba-zh-cn/g'  package/lean/autosamba/Makefile

rm -rf feeds/packages/net/smartdns
rm -rf package/lean/luci-theme-argon
rm -rf package/lean/luci-app-wrtbwmon
wget https://github.com/brvphoenix/luci-app-wrtbwmon/archive/release-1.6.3.tar.gz
tar zxvf release-1.6.3.tar.gz  -C package/                             
git clone https://github.com/brvphoenix/wrtbwmon.git                                                      package/wrtbwmon
git clone https://github.com/destan19/OpenAppFilter.git                                                   package/oaf
svn co https://github.com/Lienol/openwrt/trunk/package/diy/luci-app-adguardhome                           package/adg
git clone https://github.com/pymumu/luci-app-smartdns.git -b lede                                         package/luci-app-smartdns
svn co https://github.com/Lienol/openwrt-packages/trunk/net/smartdns                                      package/smartdns