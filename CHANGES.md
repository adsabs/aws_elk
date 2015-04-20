# Change Log
All notable changes to the config fileswill be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

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
