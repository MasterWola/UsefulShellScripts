#!/bin/bash
sudo rm -rf /minecraft
dnf -y autoremove wget openjdk-17-jdk-headless
echo 已卸载完成！
