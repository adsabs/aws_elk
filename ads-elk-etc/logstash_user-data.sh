#!/bin/bash

# Install docker and git
yum install docker -y

# Start docker
service docker start

# Run the container
docker run -d --hostname logstash --name logstash -p 6767:6767 --restart=always --log-driver syslog adsabs/logstash:a91799f291277549b16159ea87bfff3364553aab
