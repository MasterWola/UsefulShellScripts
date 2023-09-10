#!/bin/bash
MAX_MEMORY="1G"
echo ********************************建议使用 Rocky Linux 9 最新版本并使用 root 用户执行此脚本********************************
sleep 5s
echo ********************************即将开始部署 Minecraft 1.20.1服务器********************************
sleep 5s
systemctl disable --now firewalld
sed -ri 's/^(SELINUX=).*/\1disabled/' /etc/selinux/config
mkdir /minecraft
mkdir /minecraft/server /minecraft/backups
cd /minecraft/server || exit
dnf -y upgrade
dnf -y install wget java-17-openjdk-headless
wget http://piston-data.mojang.com/v1/objects/84194a2f286ef7c14ed7ce0090dba59902951553/server.jar
touch start.sh
echo java -jar -Xmx$MAX_MEMORY -server -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M server.jar nogui >> start.sh
chmod a+x start.sh
./start.sh
sed -i '3c\eula=true' eula.txt
echo ****************输入./start.sh以启动您的Minecraft 1.20.1服务器****************
echo ****************启动后在游戏中输入服务器的IP地址以访问 Minecraft 世界****************
echo ****************有任何问题请加QQ:3255838070****************
