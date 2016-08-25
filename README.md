[![Testspace](http://www.testspace.com/public/img/testspace_logo.png)](http://www.testspace.com)
***

## Ruby/Minitest sample for demonstrating Testspace 

This is the sample application for the [*Ruby on Rails Tutorial: Learn Web Development with Rails*](http://www.railstutorial.org/) by [Michael Hartl](http://www.michaelhartl.com/). It is being used to demonstrate Testspace usage models for easier test content management. 

[![Build Status](https://travis-ci.org/testspace-samples/ruby.minitest.svg?branch=master)](https://travis-ci.org/testspace-samples/ruby.minitest)
[![Space Health](http://munderseth.stridespace.com/projects/273/spaces/883/badge)](http://munderseth.stridespace.com/projects/273/spaces/883 "Test Cases")
[![Space Metric](http://munderseth.stridespace.com/projects/273/spaces/883/metrics/266/badge)](http://munderseth.stridespace.com/spaces/883/schema/Code%20Coverage "Code Coverage (lines)")
[![Space Metric](http://munderseth.stridespace.com/projects/273/spaces/883/metrics/267/badge)](http://munderseth.stridespace.com/spaces/883/schema/Static%20Analysis "Static Analysis (issues)")

***

We made a few minor modifications for reporting purposes. In order to run this sample you will need a host workstation that supports the [Minitest test framework](http://docs.seattlerb.org/minitest/). 

Running Static Analysis: 

<pre>
bundle exec rubocop --format emacs --out tmp/rubocop.txt
bundle exec brakeman -o tmp/brakeman.json
bundle exec brakeman_translate_checkstyle_format translate --file="tmp/brakeman.json" > tmp/brakeman_checkstyle.xml
bundle exec scss-lint --no-color --format=Stats --format=Default --out=tmp/scss-lint.txt  app/assets/stylesheets/
</pre> 

Running Tests with Code Coverage: 

<pre>
export CI_REPORTS=$PWD/test/reports
bundle exec rake minitest test
</pre> 

Publishing Results: 

<pre>
curl -s https://testspace-client.s3.amazonaws.com/testspace-linux.tgz | sudo tar -zxvf- -C /usr/local/bin
testspace @.testspace $TESTSPACE_TOKEN
</pre> 

Checkout the [Space](http://munderseth.stridespace.com/spaces/883). Note that the `.testspace` file contains the set of files to publish. 



***

To replicate this sample: 
  - Fork the Repo
  - Create an account at www.testspace.com.
  - Use the `Account` tab in Testspace to *Connect* to GitHub
  - Create an environment variable called `TESTSPACE_TOKEN` using the `Access token` found in the Project settings.
 