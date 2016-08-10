#!/bin/bash

# Analysis
bundle exec rubocop --require rubocop/formatter/checkstyle_formatter --format RuboCop::Formatter::CheckstyleFormatter --no-color --rails --out tmp/rubocop_checkstyle.xml
bundle exec brakeman -o tmp/brakeman.json
bundle exec brakeman_translate_checkstyle_format translate --file="tmp/brakeman.json" > tmp/brakeman_checkstyle.xml
bundle exec scss-lint --require=scss_lint_reporter_checkstyle --format=Checkstyle --out=tmp/scss-lint_checkstyle.xml  app/assets/stylesheets/

# Test
bundle exec rake minitest test

# Publish
curl -s https://testspace-client.s3-us-west-2.amazonaws.com/testspace-linux.tgz | sudo tar -zxvf- -C /usr/local/bin
export TEST_REPORTS=$PWD/test/reports
testspace publish @.testspace master.c9