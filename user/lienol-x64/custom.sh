#!/bin/bash

echo "Test custom.sh"

source ../version

rm -rf package/feeds/routing/olsrd/patches/012-gpsd.patch
rm -rf package/lean/default-settings/files/zzz-default-settings
wget https://raw.githubusercontent.com/hyird/Action-Openwrt/main/user/lienol-x64/default-settings -O package/lean/default-settings/files/zzz-default-settings

sed -i '92d'                                                                   package/system/opkg/Makefile
sed -i  "s/L20\(.[0-9].[0-9]\{1,2\}\)/L20.$version/g" package/lean/default-settings/files/zzz-default-settings
sed -i 's/DEPENDS.*/& \+luci-i18n-samba-zh-cn/g'  package/lean/autosamba/Makefile





