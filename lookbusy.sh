#!/bin/bash
basedir=/tmp/logs
if test ! -e $basedir;
then mkdir $basedir;
fi

# 清除上一轮日志
rm -rf $basedir/openssl*.log
# 循环执行10次
for i in {1..10}
do
    # 每次计算150秒，openssl内部执行六轮，共150秒*6=900秒
    openssl speed -evp aes-128-gcm -seconds 3 >> $basedir/openssl${i}.log;
    # 休息10秒，避免cpu监控连续CPU超长波峰
    sleep 1
done

# 清除wget日志
rm -rf $basedir/wget.log
rm -rf $basedir/openwrt*
# 循环执行下载50次
for j in {1..50}
do
    # 执行一次下载，约100M
    wget https://github.com/coolsnowwolf/lede/releases/download/20220716/openwrt-rockchip-R22.10.10-Docker-hinlink_opc-h68k-d-squashfs-sysupgrade.img.gz -o $basedir/openwrt.tmg.gz >> $basedir/wget.log
    # 删除下载文件
    rm -rf $basedir/openwrt.tmg.gz*;
    # 休息30秒，避免被ban
    sleep 1;
done
