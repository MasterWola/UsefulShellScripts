#!/bin/bash
MAX_MEMORY="2G"
set -eu
echo ****************必须使用 Ubuntu 操作系统执行此脚本****************
echo ****************建议使用 root 用户执行此脚本****************
echo ****************即将在3秒后开始部署 Minecraft Spigot 1.19.4 服务器****************
sleep 3s
mkdir -p /data/minecraft/server
cd /data/minecraft/server
sudo apt -y full-upgrade
sudo apt -y install wget openjdk-17-jdk-headless
sudo apt -y autopurge
wget https://download.getbukkit.org/spigot/spigot-1.19.4.jar
echo java -jar -Xmx$MAX_MEMORY -server -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M spigot-1.19.4.jar nogui >> start.sh
chmod a+x start.sh
./start.sh
sed -i '3c\eula=true' eula.txt
sed -i '23c\online-mode=false' server.properties
echo ****************Minecraft Spigot 1.19.4 服务器已部署完成****************
echo ****************输入./start.sh以启动您的 Minecraft Spigot 1.19.4 服务器****************
echo ****************启动后在游戏中输入服务器的IP:`ip -4 addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v '127.0.0.1'`以访问 Minecraft 世界****************
echo ****************有任何问题请告诉我:https://space.bilibili.com/3493134526843502****************
