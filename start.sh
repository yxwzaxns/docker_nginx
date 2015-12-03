#!/bin/bash --login
sed -i "s/influxdb/${INFLUXDB_PORT_8083_TCP_ADDR}/" /etc/nginx/conf.d/default.conf
sed -i "s/influxport/${INFLUXDB_PORT_8083_TCP_PORT}/" /etc/nginx/conf.d/default.conf
service nginx start
curl $INFLUXDB_PORT_8083_TCP_ADDR:8083
tail -f /var/log/nginx/error.log
