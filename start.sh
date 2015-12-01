#!/bin/bash --login
sed -i "s/influxdb/${INFLUXDB_PORT_8083_TCP_ADDR}/" /etc/nginx/conf.d/default.conf
service nginx start
