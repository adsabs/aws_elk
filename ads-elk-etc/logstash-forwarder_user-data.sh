#!/bin/bash
# Run as root

# User defined TAG for logstash/logstash-forwarder
if [ -z "$1" ]
  then
    TAG="DEFAULT"
else
  TAG=$1
fi

# Install docker and git
yum install docker git -y

# Clone the repository that contains the relevant docker files
git clone https://github.com/adsabs/aws_elk.git

# Start docker
service docker start

# Build Logstash container
pushd aws_elk/
docker build --tag adsabs/logstash-forwarder Dockerfiles/logstash-forwarder/

# Copy the recent logstash configuration file
mkdir -p /etc/logstash/conf.d/
pushd /etc/logstash/conf.d/
aws s3 cp s3://adsabs-elk-etc/logstash-forwarder.conf logstash-forwarder.conf

# Replace the tag with a user tag
sed -i 's@REPLACE_TAG@'$TAG'@' logstash-forwarder.conf

popd

# Copy the recent cert/key for SSL to succeed
mkdir -p /etc/pki/tls/private/logstash-forwarder/
pushd /etc/pki/tls/private/logstash-forwarder/
aws s3 cp s3://adsabs-elk-etc/logstash-forwarder.key logstash-forwarder.key
popd

mkdir -p /etc/pki/tls/certs/logstash-forwarder/
pushd /etc/pki/tls/certs/logstash-forwarder/
aws s3 cp s3://adsabs-elk-etc/logstash-forwarder.crt logstash-forwarder.crt
popd

# Run the container
docker run -d --hostname logstash-forwarder --name logstash-forwarder -v /etc/logstash/conf.d/:/etc/logstash/conf.d/ -v /tmp/:/tmp/ -v /etc/pki/tls/certs/logstash-forwarder/:/etc/pki/tls/certs/logstash-forwarder/ -v /etc/pki/tls/private/logstash-forwarder/:/etc/pki/tls/private/logstash-forwarder/ adsabs/logstash-forwarder
popd
