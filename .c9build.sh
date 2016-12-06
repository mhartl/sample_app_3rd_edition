#!/bin/bash

# Build
gem install bundler
bundle install

# Analysis
bundle exec rubocop --format emacs --out tmp/rubocop.txt
bundle exec brakeman -o tmp/brakeman.json
bundle exec brakeman_translate_checkstyle_format translate --file="tmp/brakeman.json" > tmp/brakeman_checkstyle.xml
bundle exec scss-lint --no-color --format=Stats --format=Default --out=tmp/scss-lint.txt  app/assets/stylesheets/

# Test
bundle exec rake minitest test

# Publish
#
# TESTSPACE_TOKEN = $ACCESS_TOKEN:@samples.testspace.com
# $ testspace config url $ACCESS_TOKEN:@samples.testspace.com/testspace-samples:ruby.minitest
#
curl -s https://testspace-client.s3.amazonaws.com/testspace-linux.tgz | sudo tar -zxvf- -C /usr/local/bin
BRANCH_NAME=`git symbolic-ref --short HEAD`
CI_REPORTS=$PWD/test/reports testspace @.testspace ${BRANCH_NAME}#.c9.Build