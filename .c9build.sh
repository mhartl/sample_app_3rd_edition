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

# Download Client
curl -s https://testspace-client.s3.amazonaws.com/testspace-linux.tgz | sudo tar -zxvf- -C /usr/local/bin

# Publish

BRANCH_NAME=`git symbolic-ref --short HEAD`

# Requires following environment variable to be already set
# TESTSPACE_TOKEN = $ACCESS_TOKEN:@samples.testspace.com

GIT_URL=`git remote show origin -n | grep Fetch\ URL: | sed 's/.*URL: //'`
REPO_SLUG=`echo ${GIT_URL#*github.com?} | sed 's/.git//'`

CI_REPORTS=$PWD/test/reports testspace @.testspace $TESTSPACE_TOKEN/${REPO_SLUG/\//:}/${BRANCH_NAME}#c9.Build

#############################################
# Or use the "config" option
#############################################
# testspace config $ACCESS_TOKEN:@samples.testspace.com/PROJECT-NAME
# CI_REPORTS=$PWD/test/reports testspace @.testspace ${BRANCH_NAME}#c9.Build