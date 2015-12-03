#!/bin/bash --login
sed -i "s/influxdb/${INFLUXDB_PORT_8083_TCP_ADDR}/" /etc/nginx/conf.d/default.conf
sed -i "s/influxport/${INFLUXDB_PORT_8083_TCP_PORT}/" /etc/nginx/conf.d/default.conf
sed -i "s/influxdb/${INFLUXDB_PORT_8086_TCP_ADDR}/" /etc/nginx/conf.d/8086_nginx.conf
sed -i "s/influxport/${INFLUXDB_PORT_8086_TCP_PORT}/" /etc/nginx/conf.d/8086_nginx.conf
curl $INFLUXDB_PORT_8083_TCP_ADDR:$INFLUXDB_PORT_8083_TCP_ADDR
service nginx start
tail -f /var/log/nginx/*
