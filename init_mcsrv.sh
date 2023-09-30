#!/bin/bash
MAX_MEMORY="4G"
echo ****************必须使用 Rocky Linux 用户执行此脚本****************
echo ****************建议使用 root 用户执行此脚本****************
echo ****************即将在3秒后开始部署 Minecraft Spigot 1.19.4 服务器****************
sleep 3s
systemctl disable --now firewalld
sed -ri 's/^(SELINUX=).*/\1disabled/' /etc/selinux/config
mkdir -p /minecraft/server
cd /minecraft/server || exit
sudo dnf -y upgrade
sudo dnf -y install wget java-17-openjdk-headless
sudo dnf -y autoremove
wget https://download.getbukkit.org/spigot/spigot-1.19.4.jar
echo java -Xmx$MAX_MEMORY -jar spigot-1.19.4.jar --nogui >> start.sh
chmod a+x start.sh
./start.sh
sed -i '3c\eula=true' eula.txt
sed -i '23c\online-mode=false' server.properties
cd /minecraft/server || exit
echo ****************输入./start.sh以启动您的 Minecraft Spigot 1.19.4 服务器****************
echo ****************启动后在游戏中输入服务器的IP地址以访问 Minecraft 世界****************
echo ****************有任何问题请加QQ:3255838070****************
