#!/bin/bash
basedir=/tmp/logs
newline=""
if test ! -e $basedir;
then mkdir $basedir;
ln -s $basedir ~/logs;
fi


rm -rf $basedir/openssl.log
touch $basedir/openssl.log

for i in {1..10}
do
    echo 'ROUND:'>>$basedir/openssl.log
    echo $newline >> $basedir/openssl.log
    echo 'ROUND:'
    openssl speed -evp aes-128-gcm -seconds 3 >> $basedir/openssl.log;
    sleep 1
done


rm -rf $basedir/wget.log
rm -rf $basedir/openwrt*

for j in {1..50}
do
    echo 'ROUND:'
    wget -v --show-progress https://github.com/coolsnowwolf/lede/releases/download/20220716/openwrt-rockchip-R22.10.10-Docker-hinlink_opc-h68k-d-squashfs-sysupgrade.img.gz -O $basedir/openwrt.tmg.gz >> $basedir/wget.log
    rm -rf $basedir/openwrt.tmg.gz*;
    rm -rf 
    sleep 1;
done
