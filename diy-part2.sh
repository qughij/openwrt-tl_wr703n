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

# for wr703n with 16m
sed -i '227s/4mlzma/16mlzma/g' target/linux/ath79/image/tiny-tp-link.mk
sed -i 's/0x20000 0x3d0000/0x20000 0xfd0000/g' target/linux/ath79/dts/ar9331_tplink_tl-wr703n_tl-mr10u.dtsi
sed -i 's/0x3f0000 0x10000/0xff0000 0x10000/g' target/linux/ath79/dts/ar9331_tplink_tl-wr703n_tl-mr10u.dtsi

# make defconfig
sed -i 's/^[ \t]*//g' ./.config
make defconfig
