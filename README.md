# zbx-ping-time

a trivial zabbix agent plugin to do remote ping time collection,
somewhat inspired by smokeping


## Zabbix Agent Setup


### place the script

* copy this script to /opt/zabbix/bin/ping_time.sh
* make it executable, you might need to fix selinux perms to make it run ok

### configure the agent to call the script

create a file on the/etc/zabbix/zabbix_agentd.conf.d/ping_time.conf containing this:

```
UserParameter=custom.ping.time[*],/opt/zabbix/bin/ping_time.sh "$1" "$2"
```

## Zabbix Server Setup

* add an item to the host called e.g. "ping.time.myhost-3x"
* set the key with the host and the count, e.g. "custom.ping.time[myhost,3]"
* set the type of information to "Numeric (float)"
* set the units to "ms" and to run when you want e.g. 1m interval
* set the history and storage as desired, e.g. 30d for history, 60d for trend
* save then test the item
* create a graph of the item

Here's a screenshot

![server side item](https://raw.githubusercontent.com/speculatrix/zbx-ping-time/main/zabbix_ping_time.server-item.png "server side item")

