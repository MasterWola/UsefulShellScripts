#!/bin/bash
VERSION="1.24.0"
echo ********************************建议使用 Rocky Linux 9 最新版本并使用 root 用户执行本脚本********************************
echo ********************************即将在3秒后开始安装并开机启动 Nginx 1.24.0********************************
sleep 3s
systemctl disable --now firewalld
sed -ri 's/^(SELINUX=).*/\1disabled/' /etc/selinux/config
mkdir -p /apps/nginx-$VERSION
dnf -y upgrade
dnf -y install wget tar gcc pcre-devel zlib-devel openssl-devel
cd /usr/local/src || exit
wget http://nginx.org/download/nginx-$VERSION.tar.gz
tar xvf nginx-$VERSION.tar.gz
rm -rf nginx-$VERSION.tar.gz
cd nginx-$VERSION || exit
./configure --prefix=/apps/nginx-$VERSION
make -j grep -c ^processor /proc/cpuinfo
make install
cd /apps/nginx-$VERSION/sbin || exit
rm -rf /usr/local/src/nginx-$VERSION
./nginx
cd
echo ****************Nginx 1.24.0 部署完成****************
echo ****************请通过您的浏览器上输入IP以访问 Nginx 默认页面****************
echo ****************有任何问题请加QQ:3255838070或在我的 Github 主页中反馈****************
