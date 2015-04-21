#!/bin/bash

openssl req -x509 -batch -subj '/CN=*.*.elb.amazonaws.com' -nodes -newkey rsa:2048 -keyout logstash-forwarder.key -out logstash-forwarder.crt -days 3650
cp logstash-forwarder.crt local_ads-elk-etc/logstash-forwarder.crt
cp logstash-forwarder.key local_ads-elk-etc/logstash-forwarder.key
rm logstash-forwarder.crt logstash-forwarder.key
