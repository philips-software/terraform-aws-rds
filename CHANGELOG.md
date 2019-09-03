# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

## [2.0.0] - 2019-09-03
- Upgrade to Terraform 0.12
- Add github actions

## [1.1.0] - 2018-08-08
- Updated the Terraform version in the .terraform-version file (tfenv)
- Added default provider region to postgres example
- Removed the unique timestamp for the final snapshot as this results in a change a change on every apply
- Added option to provide a custom snapshot identifier using variable

## [1.0.0] - 2018-06-21
https://github.com/philips-software/terraform-aws-rds/tags/1.0.0

[Unreleased]: https://github.com/philips-software/terraform-aws-rds/compare/2.0.0...HEAD
[2.0.0]: https://github.com/philips-software/terraform-aws-rds/compare/1.1.0...2.0.0
[1.1.0]: https://github.com/philips-software/terraform-aws-rds/compare/1.0.0...1.1.0
