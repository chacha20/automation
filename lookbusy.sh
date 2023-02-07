#!/bin/bash
basedir=/tmp

rm -rf $basedir/lookbusy.log
touch $basedir/lookbusy.log

for i in {1..10}
do
    echo "" >> $basedir/lookbusy.log
    echo `date`>>$basedir/lookbusy.log
    openssl speed -evp aes-128-gcm -seconds 150 >> $basedir/lookbusy.log;
    sleep 1
done


rm -rf $basedir/lookbusy.log

# filesize 100M/limits to 4MB/s
for j in {1..50}
do
    echo `date`>>$basedir/lookbusy.log
    wget --limit-rage=4M https://github.com/coolsnowwolf/lede/releases/download/20220716/openwrt-rockchip-R22.10.10-Docker-hinlink_opc-h68k-d-squashfs-sysupgrade.img.gz -O $basedir/openwrt.tmg.gz
    rm -rf $basedir/openwrt*.img.gz*;
    rm -rf 
    sleep 1;
done
