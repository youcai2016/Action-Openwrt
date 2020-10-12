#!/bin/bash

echo "Test custom.sh"

source ../version

rm -rf package/lean/default-settings/files/zzz-default-settings
wget https://raw.githubusercontent.com/hyird/Action-Openwrt/main/user/lienol-x64/default-settings -O package/default-settings/files/zzz-default-settings

sed -i '92d'                                                                   package/system/opkg/Makefile
sed -i  "s/L20\(.[0-9].[0-9]\{1,2\}\)/L20.$version/g" package/default-settings/files/zzz-default-settings
sed -i 's/DEPENDS.*/& \+luci-i18n-samba-zh-cn/g'  package/lean/autosamba/Makefile
rm -rf package/feeds/diy1/naiveproxy
git clone https://github.com/fw876/helloworld.git package/helloworld
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/redsocks2 package/redsocks2





