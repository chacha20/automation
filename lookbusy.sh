cd /tmp
mkdir logs;

# 清除上一轮日志
rm -rf /tmp/logs/openssl*.log
# 循环执行10次
for((i=1;i<=10;i++));
do
    # 每次计算150秒，openssl内部执行六轮，共150秒*6=900秒
    openssl speed -evp aes-128-gcm -seconds 150 >> /tmp/logs/openssl${i}.log;
    # 休息10秒，避免cpu监控连续CPU超长波峰
    sleep 10
done;

# 清除wget日志
rm -rf /tmp/logs/wget*.log
# 循环执行下载50次
for((i=1;i<50;i++));
do
    # 删除前期下载文件
    rm -rf /tmp/logs/openwrt.tmg.gz*;
    # 执行一次下载，约100M
    wget https://github.com/coolsnowwolf/lede/releases/download/20220716/openwrt-rockchip-R22.10.10-Docker-hinlink_opc-h68k-d-squashfs-sysupgrade.img.gz -o /tmp/logs/openwrt.tmg.gz >> ~/logs/wget${i}.log
    # 删除下载文件
    rm -rf /tmp/logs/openwrt.tmg.gz*;
    # 休息30秒，避免被ban
    sleep 30;
done;
