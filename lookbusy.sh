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

# filesize 400M, limit download speed to 4MB/s
for j in {1..50}
do
    echo `date`>>$basedir/lookbusy.log
    wget --limit-rage=4M https://cloud.centos.org/centos/7/vagrant/x86_64/images/CentOS-7-x86_64-Vagrant-2004_01.VirtualBox.box -O $basedir/downloadfile.box
    rm -rf $basedir/downloadfile.box*;
    sleep 1;
done
