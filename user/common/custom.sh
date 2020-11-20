#!/bin/bash

echo "Apply custom.sh"

sed -i 's/DEPENDS.*/& \+luci-i18n-mwan3-zh-cn/g'  package/lean/luci-app-syncdial/Makefile
sed -i 's/DEPENDS.*/& \+kmod-usb-core +kmod-usb-ohci +kmod-usb-uhci +kmod-usb-storage +kmod-usb-storage-extras +kmod-usb2 +kmod-scsi-core/g'  package/lean/automount/Makefile

rm -rf feeds/packages/libs/libcap
svn co https://github.com/openwrt/packages/trunk/libs/libcap feeds/packages/libs/libcap

sed -i "s/PKG_SOURCE_URL:=.*/PKG_SOURCE_URL:=https:\/\/github\.com\/1715173329\/dnsforwarder\.git/" package/lean/dnsforwarder/Makefile
sed -i "s/PKG_SOURCE_VERSION:=.*/PKG_SOURCE_VERSION:=693b554e59479c2867c74f0bb5e26290b93747c5/" package/lean/dnsforwarder/Makefile
sed -i "s/\ \ URL:=.*/\ \ URL:=https:\/\/github\.com\/1715173329\/dnsforwarder/" package/lean/dnsforwarder/Makefile

git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom.git                             package/luci-theme-infinityfreedom
git clone https://github.com/yangsongli/luci-theme-atmaterial.git                                        package/luci-theme-atmaterial
git clone https://github.com/jerrykuku/luci-theme-argon.git -b 18.06                                     package/luci-theme-argon-jerrykuku
git clone https://github.com/tty228/luci-app-serverchan.git                                              package/luci-app-serverchan
git clone https://github.com/vernesong/OpenClash.git -b master                                           package/luci-app-openclash
git clone https://github.com/tindy2013/openwrt-subconverter.git                                          package/openwrt-subconverter
git clone https://github.com/garypang13/luci-app-eqos								                     package/luci-app-eqos
git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git                                         package/luci-theme-opentomcat
git clone https://github.com/Leo-Jo-My/luci-theme-opentomato.git                                         package/luci-theme-opentomato
git clone https://github.com/jerrykuku/luci-app-argon-config.git                                         package/luci-app-argon-config
git clone https://github.com/jerrykuku/lua-maxminddb.git                                                 package/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr.git                                                 package/luci-app-vssr

cat > package/lean/wget/patches/002-edit-ua.patch <<EOF
--- a/src/http.c	2019-04-02 02:11:25.000000000 +0800
+++ b/src/http.c	2020-11-20 01:36:24.652240500 +0800
@@ -1772,7 +1772,7 @@
 #define SET_USER_AGENT(req) do {                                         \
   if (!opt.useragent)                                                    \
     request_set_header (req, "User-Agent",                               \
-                        aprintf ("Wget/%s (VMS %s %s)",                  \
+                        aprintf ("hyird",                  \
                         version_string, vms_arch(), vms_vers()),         \
                         rel_value);                                      \
   else if (*opt.useragent)                                               \
@@ -1782,7 +1782,7 @@
 #define SET_USER_AGENT(req) do {                                         \
   if (!opt.useragent)                                                    \
     request_set_header (req, "User-Agent",                               \
-                        aprintf ("Wget/%s (%s)",                         \
+                        aprintf ("hyird",                         \
                         version_string, OS_TYPE),                        \
                         rel_value);                                      \
   else if (*opt.useragent)                                               \
EOF
