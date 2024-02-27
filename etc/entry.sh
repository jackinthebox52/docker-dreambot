#!/bin/bash

# prepare ssh server
mkdir -p /var/run/sshd
sed -i '/PermitRootLogin/c PermitRootLogin yes' /etc/ssh/sshd_config
if [ ! $SSHPW ]; then  
    SSHPW=`pwgen -c -n -1 12`
fi
echo "root:$SSHPW" | chpasswd
echo "ssh login password: $SSHPW"

if [ -n "$RESOLUTION" ]; then
    sed -i "s/1024x768/$RESOLUTION/" /etc/docker-dreambot/supervisord.conf
fi


#Start all of our stuff
/usr/bin/supervisord -c /etc/docker-dreambot/supervisord.conf

./etc/docker-dreambot/launch-dreambot.sh

/bin/bash