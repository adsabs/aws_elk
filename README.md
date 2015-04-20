# AWS Elasticsearch/Logstash/Kibana stack for centralised logging of the ADSAWS

# Setup

## ELK Stack

The following centralised logging stack is being used:

  1. Logstash-forwarder: sits on the server with the relevant log files or log stream, and forwards it to a Logstash instance that sits on another machine.

  1. Logstash: receives logs from logstash-forwarder, parses the logs (*grok*-ing) and outputs to the search engine elasticsearch.

  1. Elasticsearch: receives time-stamped and meta-data rich logs from logstash and indexes them.

  1. Kibana: a web interfrace that can be used to search and make visualisations of the logs that are sent to logstash.

# Deployment

# OpenSSL
