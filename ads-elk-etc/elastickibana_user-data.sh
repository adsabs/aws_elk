#!/bin/bash

# Install docker and git
yum install docker -y

# Start docker
service docker start

# Run the containers
## First start elasticsearch
docker run -d --name elasticsearch -p 9200:9200 -p 9300:9300 adsabs/elasticsearch:d7cd21774e7a5c62c82af77871b2f3fec31f9506

## Second start kibana
## Kibana should wait for elasticsearch to be ready, otherwise it will crash
## But I do not want it to stay in an infinite loop, so after 60 seconds, there is
## clearly something wrong with elasticsearch that warrants users intervention

## Given phusion/image is used for kibana, it should be fine that you do not use
## the following, as it will keep trying to restart, but for now I will leave it.

ELASTICSEARCH_HOST="http://localhost:9200"
time_out=60
for i in `seq "$time_out"`
do
  response=$(curl -sL -w "%{http_code}\\n" "$ELASTICSEARCH_HOST" -o /dev/null)

  if [ $response -ne 200 ]
  then
    echo "Elasticsearch service is offline ($ELASTICSEARCH_HOST), trying again..."
  else
    echo "Elasticsearch online"
    break
  fi

  if [ "$i" == "$time_out" ]
  then
    echo "Reached timeout limit of $time_out seconds. Kibana will probably not start correctly."
  fi

  sleep 1
done

docker run -d --name kibana --link elasticsearch:elasticsearch -p 5601:5601 adsabs/kibana:cdf22333579930dd777cc63ce779658fccd45b7a

