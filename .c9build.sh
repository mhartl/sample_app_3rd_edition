#!/bin/bash

# Build
# gem install bundler
# bundle install

# Analysis
bundle exec rubocop --format emacs --out tmp/rubocop.txt
bundle exec brakeman -o tmp/brakeman.json
bundle exec brakeman_translate_checkstyle_format translate --file="tmp/brakeman.json" > tmp/brakeman_checkstyle.xml
bundle exec scss-lint --require=scss_lint_reporter_checkstyle --format=Checkstyle --out=tmp/scss-lint_checkstyle.xml  app/assets/stylesheets/

# Test
export CI_REPORTS=$PWD/test/reports
bundle exec rake minitest test

# Publish
# curl -s https://testspace-client.s3.amazonaws.com/testspace-linux.tgz | sudo tar -zxvf- -C /usr/local/bin
# export CI_REPORTS=$PWD/test/reports
# testspace publish @.testspace BRACH-NAME.c9