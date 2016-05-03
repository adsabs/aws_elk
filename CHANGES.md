# Change Log
All notable changes to the config fileswill be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [0.9.13] - 2016-05-03
### Changed
Elasticsearch had wrong version in docker run
Logstash now ignores Elastichealth check messages

## [0.9.12] - 2015-08-05
### Changed
Upgraded the elastickibana user data so that the docker containers for elasticsearch
and kibana from the DockerHub registry, rather than building it no the machine.

## [0.9.11] - 2015-08-04
### Changed
Logstash has been moves into a Docker container that is now hosted on our
DockerHub account. As such, no building information is required in the S3 storage
in regards to the user-data.sh.

## [0.9.10] - 2015-07-27
### Changed
Updated the logstash certs to be for CNAMEs related to Amazon Route 53. This
makes the SSL certs no longer contain semi-"sensitive" information.

Updated the config file to use Route 53 address and not the actual ip.

## [0.9.9] - 2015-07-07
### Added
`elasticsearch/resources/runscript.sh` - this runs curator
`elasticsearch/resources/cronjob.sh` - the crontab to be added that runs curator daily

### Changed
The Dockerfile for elasticsearch was modified such that it now installs the
elsaticsearch curator. This is to be run once a day, and deletes any index that
is older than 31 days.

## [0.9.8] - 2015-05-26
### Added
`solr` grok pattern added in patterns/solr

### Changed
`logstash.conf` updated to differentiate between tags
`logstash_user-data.sh` updated to include the new `solr` pattern
`logstash-forwarder.conf` updated to include a tag when sending logs
`logtsash-forwarder_user-data.sh` updated to allow the user to define the tag
to be placed within logstash-forwarder on deployment. If the user passes nothing
it will default to apache style parsing of the logs.
User data of logstash to redirect logs to syslog

## [0.9.7] - 2015-05-19
### Changed
logstash.conf - S3 output will not work unless you specify that it is in json
format. This is an old bug, meant to be 'fixed', but seemingly still is there.

Specifically copy the file 'api', rather than recursively copy the patterns. I
chose this because the file was missing, but it will be more explicit to know
which patterns are being copied over, unless the number gets much larger.

Turned of stdout from rubydebug as it spams the containers disk.

Re-directed the logs from logstash to syslog.

## [0.9.6] - 2015-04-22
>>>>>>> develop
### Changed
Updated mount of /tmp/logs/ to /tmp/
Updated mount of logstash-forwarder.conf to just conf.d/
Fixed a spelling mistake of logstash-forwarder, 'forwader', derp!
Added S3 plugin definitions to logstash configuration

## [0.9.5] - 2015-04-21
### Changed
Modified logstash-forwarder config file so that all log files in /tmp/ get forwarded to logstash

## [0.9.4] - 2015-04-21
### Changed
Modified the logtash grok pattern for the API
Modified the logstash user data to copy the pattern folder from S3 storage
Added a patterns/ folder

## [0.9.3] - 2015-04-20
### Changed
Uploaded key and crt files had the wrong CommonName and have been updated to have
the correct one.

## [0.9.2] - 2015-04-20
### Changed
Forgot to add the .crt and .key files for logstash. They are now uploaded and
added to the repo. Given logstash, etc., are inside the VPN, it does not matter
that these keys are public

## [0.9.1] - 2015-04-20
### Changed
- config files changed to use the new repository aws_elk maintained on the
ADS repository
- user_data.sh files are now expected to sit on S3 storage, and must be replaced
every time that the CHANGES log is updated
