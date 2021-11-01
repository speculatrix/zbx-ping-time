# zbx-ping-time

a trivial zabbix agent plugin to do remote ping time collection,
somewhat inspired by smokeping


# Zabbix Agent Setup

copy this script to /opt/zabbix/bin/ping_time.sh
and make it executable, you might need to fix selinux perms to make it run ok

create a file on the/etc/zabbix/zabbix_agentd.conf.d/ping_time.conf containing this:
UserParameter=custom.ping.time[*],/opt/zabbix/bin/ping_time.sh "$1" "$2"
obviously, without the # commenting-out


# Zabbix Server Setup

add an item to the host called e.g. "ping.time.myhost-3x"
set the key with the host and the count, e.g. "custom.ping.time[myhost,3]"
sedt the type of information to "Numeric (float)"
set the units to "ms" and to run when you want e.g. 1m interval
set the history and storage as desired, e.g. 30d for history, 60d for trend
save then test the item
create a graph of the item


