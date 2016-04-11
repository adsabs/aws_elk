#!/bin/bash

# Install docker and git
yum install docker -y

# Start docker
service docker start

# Run the container
docker run -d --hostname logstash --name logstash -p 6767:6767 --restart=always --log-driver syslog adsabs/logstash:e51a8b4e7d61e2d88f5669fc524a9586a3630091
