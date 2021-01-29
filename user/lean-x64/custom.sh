#!/bin/bash

echo "Apply custom.sh"

source ../version

rm -rf package/feeds/routing/olsrd/patches/012-gpsd.patch
rm -rf package/lean/default-settings/files/zzz-default-settings
wget https://raw.githubusercontent.com/coolsnowwolf/lede/99222f49fd9f63eef575ac34f251280e6e97f3b3/package/lean/default-settings/files/zzz-default-settings -O package/lean/default-settings/files/zzz-default-settings
sed -i 's/DEPENDS.*/& \+luci-i18n-samba-zh-cn/g'  package/lean/autosamba/Makefile

sed -i '92d'                                                                   package/system/opkg/Makefile
sed -i '/shadow/d'                     package/lean/default-settings/files/zzz-default-settings
sed -i '/nas/d'                     package/lean/default-settings/files/zzz-default-settings
sed -i "s/openwrt.proxy.ustclug.org/openwrt.download/g"  package/lean/default-settings/files/zzz-default-settings
sed -i "s/https:/R20.0.0/g"  package/lean/default-settings/files/zzz-default-settings
sed -i  's/http:/snapshots/g'  package/lean/default-settings/files/zzz-default-settings
sed -i  " 23i sed -i 's/http:/https:/g' /etc/opkg/distfeeds.conf"  package/lean/default-settings/files/zzz-default-settings
sed -i  "s/R20\(.[0-9].[0-9]\{1,2\}\)/R21.$version/g" package/lean/default-settings/files/zzz-default-settings

sed -i "44i echo 'src/gz openwrt_all https://openwrt.download/ExtraPackages/all' > /etc/opkg/customfeeds.conf " package/lean/default-settings/files/zzz-default-settings
sed -i "45i echo 'src/gz openwrt_ipk https://openwrt.download/ExtraPackages/x86_64' >> /etc/opkg/customfeeds.conf " package/lean/default-settings/files/zzz-default-settings

rm -rf feeds/packages/net/smartdns
rm -rf package/lean/luci-theme-argon

svn co https://github.com/Lienol/openwrt/trunk/package/diy/luci-app-adguardhome                           package/adg
git clone https://github.com/yfdoor/OpenWrt-AdGuardHome.git                                               package/AdGuardHome
sed -i 's/DEPENDS.*/& \+AdGuardHome/g'  package/adg/Makefile
git clone https://github.com/pymumu/luci-app-smartdns.git -b lede                                         package/luci-app-smartdns
svn co https://github.com/Lienol/openwrt-packages/trunk/net/smartdns                                      package/smartdns
