#!/bin/bash
set -eu
echo ****************必须使用 Ubuntu 操作系统执行此脚本****************
echo ****************建议使用 root 用户执行此脚本****************
echo ****************即将在3秒后开始安装并开机启动 Nginx 1.24.0****************
sleep 3s
mkdir -p /data/apps/nginx-$VERSION
sudo apt -y update
sudo apt -y full-upgrade
sudo apt -y install curl gnupg2 ca-certificates lsb-release ubuntu-keyring
curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor \
    | sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" \
    | sudo tee /etc/apt/sources.list.d/nginx.list
echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" \
    | sudo tee /etc/apt/preferences.d/99nginx
sudo apt -y install nginx
systemctl enable --now nginx
echo ****************Nginx 1.24.0 已部署完成****************
echo ****************请在浏览器上输入IP:`ip -4 addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v '127.0.0.1'
`以访问 Nginx 默认页面****************
echo ****************有任何问题请告诉我:https://space.bilibili.com/3493134526843502****************
