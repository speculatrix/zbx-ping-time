#!/bin/bash

## Zabbix Agent Setup
# copy this script to /opt/zabbix/bin/ping_time.sh
# and make it executable, you might need to fix selinux perms to make it run ok
#
# create a file on the/etc/zabbix/zabbix_agentd.conf.d/ping_time.conf containing this:
# UserParameter=custom.ping.time[*],/opt/zabbix/bin/ping_time.sh "$1" "$2"
# obviously, without the # commenting-out


## Zabbix Server Setup
# add an item to the host called e.g. "ping.time.myhost-3x"
# set the key with the host and the count, e.g. "custom.ping.time[myhost,3]"
# sedt the type of information to "Numeric (float)"
# set the units to "ms" and to run when you want e.g. 1m interval
# set the history and storage as desired, e.g. 30d for history, 60d for trend
# save then test the item
# create a graph of the item


TARG="$1"
CNT="$2"

if [ "$TARG" == "" ] ; then
	echo "Error, target cannot be blank"
	exit 127
fi

# allow count to be blank and default to 1
if [ "$CNT" == "" ] ; then
	CNT=1
fi

# for debugging purposes
#echo "/usr/sbin/ping -n -c \"$CNT\" \"$TARG\" | sed 's#/# #g' | awk '/rtt min/{print $8}'" >> /tmp/ping_time.sh.out

/usr/sbin/ping -n -c "$CNT" "$TARG" | sed 's#/# #g' | awk '/rtt min/{print $8}'
exit $?


