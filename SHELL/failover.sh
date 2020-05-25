#!/bin/sh

LOG=/home/worker/redis/failover.log
VIP=172.18.1.90
MASTERIP=${6}
MASK=23
IFACE=eth1
MYIP=($(ip -4 -o addr show dev ${IFACE} | awk '{split($4,a,"/");print a[1]}'))

set -e
echo "Start..." >> ${LOG}
date >> ${LOG}
echo $@ >> ${LOG}
id >> ${LOG}

echo "Master: ${MASTERIP} My IP: ${MYIP[0]}" >> ${LOG}
if [ ${MASTERIP} = ${MYIP[0]} ]; then
        if [ $(ip addr show ${IFACE} | grep ${VIP} | wc -l) = 0 ]; then
                sudo /sbin/ip addr add ${VIP}/${MASK} dev ${IFACE}
                echo "sudo /sbin/ip addr add ${VIP}/${MASK} dev ${IFACE}" >> ${LOG}
                /usr/sbin/arping -q -c 3 -A ${VIP} -I ${IFACE}
        fi
        exit 0
else
        if [ $(ip addr show ${IFACE} | grep ${VIP} | wc -l) != 0 ]; then
                sudo /sbin/ip addr del ${VIP} dev ${IFACE}
                echo "sudo /sbin/ip addr del ${VIP} dev ${IFACE}" >> ${LOG}
        fi
        exit 0
fi
exit 1
