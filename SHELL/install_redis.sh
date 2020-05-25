#!/bin/bash

HOST=$(hostname)
WORK="/vagrant/WORK/"
SHELL="/vagrant/SHELL/"
CONF="/vagrant/CONF/"
REDIS="/home/worker/redis/"

# redisインストール
cd ${WORK}
tar xzf redis-4.0.14.tar.gz 
cd redis-4.0.14
sudo make install PREFIX=${REDIS}

# start script登録
sudo chown root:root ${WORK}*.service
sudo cp ${WORK}*.service /usr/lib/systemd/system/

# 自動スタート設定
sudo systemctl enable redis-server
sudo systemctl enable sentinel

# kernel設定＆適用
sudo cat ${WORK}sysctl.conf >> /etc/sysctl.conf
sudo sysctl -p
ls -al ${SHELL}failover.sh
sudo ls -al ${REDIS}
sudo cp ${SHELL}failover.sh ${REDIS}failover.sh

# sudoers登録
echo "worker        ALL=(ALL)        NOPASSWD:/sbin/ip" >| /etc/sudoers.d/redis

# redis command path設定
sudo echo "PATH=$PATH:/home/worker/redis/bin" >> /etc/profile

# 各サーバ別に設定ファイルコピー
case ${HOST} in
	cent1)
		# redis masterに仮想IP up
		sudo /sbin/ip addr add 172.18.1.90/24 dev eth1
		sudo cp ${CONF}1m/*.conf ${REDIS} ;;
	cent2)
		sudo cp ${CONF}s1/*.conf ${REDIS} ;;
	cent3)
		sudo cp ${CONF}s2/*.conf ${REDIS} ;;
esac
		
sudo chown worker:worker ${REDIS} -R
