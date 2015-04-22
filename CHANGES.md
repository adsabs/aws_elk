# Change Log
All notable changes to the config fileswill be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [0.9] - 2015-04-22
### Changed
Updated mount of /tmp/logs/ to /tmp/
Updated mount of logstash-forwarder.conf to just conf.d/
Fixed a spelling mistake of logstash-forwarder, 'forwader', derp!
Added S3 plugin definitions to logstash configuration

## [0.9] - 2015-04-21
### Changed
Modified logstash-forwarder config file so that all log files in /tmp/ get forwarded to logstash

## [0.9] - 2015-04-21
### Changed
Modified the logtash grok pattern for the API
Modified the logstash user data to copy the pattern folder from S3 storage
Added a patterns/ folder

## [0.9] - 2015-04-20
### Changed
Uploaded key and crt files had the wrong CommonName and have been updated to have
the correct one.

## [0.9] - 2015-04-20
### Changed
Forgot to add the .crt and .key files for logstash. They are now uploaded and
added to the repo. Given logstash, etc., are inside the VPN, it does not matter
that these keys are public

## [0.9] - 2015-04-20
### Changed
- config files changed to use the new repository aws_elk maintained on the
ADS repository
- user_data.sh files are now expected to sit on S3 storage, and must be replaced
every time that the CHANGES log is updated
