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
# sed -i 's/192.168.1.1/192.168.0.1/g' package/base-files/files/bin/config_generate   # 修改默认ip
#sed -i 's/\/bin\/ash/\/bin\/bash/' package/base-files/files/etc/passwd    # 替换终端为bash
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
#sed -i 's/+uhttpd +uhttpd-mod-ubus //g' feeds/luci/collections/luci/Makefile    # 删除uhttpd
#sed -i '/CYXluq4wUazHjmCDBCqXF/d' package/lean/default-settings/files/zzz-default-settings    # 设置密码为空
#sed -i 's/PATCHVER:=6.1/PATCHVER:=5.4/g' target/linux/x86/Makefile   # x86机型,默认内核5.10，修改内核为5.15
#sed -i 's/PATCHVER:=6.6/PATCHVER:=5.4/g' target/linux/x86/Makefile   # x86机型,默认内核5.10，修改内核为5.15
#sed -i '$ a uci commit uhttpd' package/lean/default-settings/files/zzz-default-settings

# feed重建
#./scripts/feeds clean
#./scripts/feeds update -a
#./scripts/feeds install -a

#替换为新版本golang
#rm -rf feeds/packages/lang/golang

#删除small中的oc
rm -rf feeds/small/luci-app-openclash

#删除luci/applications/luci-app-ksmbd
rm -rf feeds/luci/applications/luci-app-samba4
rm -rf feeds/luci/applications/luci-app-ksmbd
rm -rf package/lean/autosamba

#git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
#./scripts/feeds install -a
# rm -rf feeds/packages/utils/runc/Makefile   # 临时删除run1.0.3
# svn export https://github.com/openwrt/packages/trunk/utils/runc/Makefile feeds/packages/utils/runc/Makefile   # 添加runc1.0.2


#git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
#git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config

# 调整 Docker 到 服务 菜单
# sed -i 's/"admin"/"admin", "services"/g' feeds/luci/applications/luci-app-dockerman/luasrc/controller/*.lua
# sed -i 's/"admin"/"admin", "services"/g; s/admin\//admin\/services\//g' feeds/luci/applications/luci-app-dockerman/luasrc/model/cbi/dockerman/*.lua
# sed -i 's/admin\//admin\/services\//g' feeds/luci/applications/luci-app-dockerman/luasrc/view/dockerman/*.htm
# sed -i 's|admin\\|admin\\/services\\|g' feeds/luci/applications/luci-app-dockerman/luasrc/view/dockerman/container.htm

# 调整 ZeroTier 到 服务 菜单
sed -i 's/vpn/services/g; s/VPN/Services/g' feeds/luci/applications/luci-app-zerotier/luasrc/controller/zerotier.lua
sed -i 's/vpn/services/g' feeds/luci/applications/luci-app-zerotier/luasrc/view/zerotier/zerotier_status.htm

# 取消对 samba4 的菜单调整
# sed -i '/samba4/s/^/#/' package/lean/default-settings/files/zzz-default-settings

# 修改插件名字
sed -i 's/"aMule设置"/"电驴下载"/g' `egrep "aMule设置" -rl ./`
# sed -i 's/"网络存储"/"NAS"/g' `egrep "网络存储" -rl ./`
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' `egrep "Turbo ACC 网络加速" -rl ./`
sed -i 's/"实时流量监测"/"流量"/g' `egrep "实时流量监测" -rl ./`
sed -i 's/"KMS 服务器"/"KMS激活"/g' `egrep "KMS 服务器" -rl ./`
sed -i 's/"TTYD 终端"/"终端"/g' `egrep "TTYD 终端" -rl ./`
sed -i 's/"USB 打印服务器"/"打印服务"/g' `egrep "USB 打印服务器" -rl ./`
sed -i 's/"Web 管理"/"Web管理"/g' `egrep "Web 管理" -rl ./`
sed -i 's/"管理权"/"改密码"/g' `egrep "管理权" -rl ./`
sed -i 's/"带宽监控"/"监控"/g' `egrep "带宽监控" -rl ./`
sed -i 's/"设置向导"/"向导"/g' `egrep "设置向导" -rl ./`
sed -i 's/"USB 打印服务器"/"打印服务"/g' `egrep "USB 打印服务器" -rl ./`
sed -i 's/"挂载 SMB 网络共享"/"SMB网络共享"/g' `egrep "挂载 SMB 网络共享" -rl ./`
sed -i 's/"解锁网易云灰色歌曲"/"解锁网易云"/g' `egrep "解锁网易云灰色歌曲" -rl ./`
sed -i 's/"AirPlay 2 音频接收器"/"音频接收器"/g' `egrep "AirPlay 2 音频接收器" -rl ./`
sed -i 's/"MWAN3 分流助手"/"分流助手"/g' `egrep "MWAN3 分流助手" -rl ./`
sed -i 's/"UU游戏加速器"/"游戏加速"/g' `egrep "UU游戏加速器" -rl ./`
sed -i 's/"ShadowSocksR Plus+"/"SSR Plus+"/g' `egrep "ShadowSocksR Plus+" -rl ./`
sed -i 's/"广告屏蔽大师 Plus+"/"屏广大师"/g' `egrep "广告屏蔽大师 Plus+" -rl ./`
sed -i 's/"iKoolProxy 滤广告"/"过滤广告"/g' `egrep "iKoolProxy 滤广告" -rl ./`
sed -i 's/"DDNSTO 远程控制"/"远程控制"/g' `egrep "DDNSTO 远程控制" -rl ./`
sed -i 's/"Argon 主题设置"/"主题设置"/g' `egrep "Argon 主题设置" -rl ./`
sed -i 's/"AdGuard Home"/"AdGuard"/g' `egrep "AdGuard Home" -rl ./`
sed -i 's/"Alist 文件列表"/"网盘搜刮"/g' `egrep "Alist 文件列表" -rl ./`
sed -i 's/"SoftEther VPN 服务器"/"SoftEther"/g' `egrep "SoftEther VPN 服务器" -rl ./`
sed -i 's/"OpenVPN 服务器"/"OpenVPN"/g' `egrep "OpenVPN 服务器" -rl ./`
sed -i 's/"IPSec VPN 服务器"/"IPSec VPN"/g' `egrep "IPSec VPN 服务器" -rl ./`
sed -i 's/"PPTP VPN 服务器"/"PPTP VPN"/g' `egrep "PPTP VPN 服务器" -rl ./`
sed -i 's/"UU游戏加速器"/"游戏加速"/g' `egrep "UU游戏加速器" -rl ./`
sed -i 's/"Online User"/"在线用户"/g' `egrep "Online User" -rl ./`
sed -i 's/"备份与升级"/"备份/升级"/g' `egrep "备份与升级" -rl ./`
sed -i 's/"UPnP"/"即插即用"/g' `egrep "UPnP" -rl ./`


./scripts/feeds update -a
./scripts/feeds install -a
