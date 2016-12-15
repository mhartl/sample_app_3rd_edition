[![Testspace](http://www.testspace.com/img/Testspace.png)](http://www.testspace.com)

***

## Ruby/Minitest sample for demonstrating Testspace 

This is the sample application for the [*Ruby on Rails Tutorial: Learn Web Development with Rails*](http://www.railstutorial.org/) by [Michael Hartl](http://www.michaelhartl.com/). It is being used to demonstrate Testspace  publishing test content. 
We made a few minor modifications for reporting purposes. 

***
Using Multiple Online CI Services:

[![Build Status](https://travis-ci.org/testspace-samples/ruby.minitest.svg?branch=master)](https://travis-ci.org/testspace-samples/ruby.minitest)
[![CircleCI](https://circleci.com/gh/testspace-samples/ruby.minitest/tree/master.svg?style=svg)](https://circleci.com/gh/testspace-samples/ruby.minitest/tree/master)
[![Run Status](https://api.shippable.com/projects/5703dabb2a8192902e1b99ce/badge?branch=master)](https://app.shippable.com/projects/5703dabb2a8192902e1b99ce)


***
Publishing **Test Content** using www.testspace.com.

[![Space Health](https://samples.testspace.com/projects/157/spaces/676/badge)](https://samples.testspace.com/projects/157/spaces/676 "Test Cases")
[![Space Metric](https://samples.testspace.com/projects/157/spaces/676/metrics/604/badge)](https://samples.testspace.com/spaces/676/schema/Code%20Coverage "Code Coverage (lines)")
[![Space Metric](https://samples.testspace.com/projects/157/spaces/676/metrics/605/badge)](https://samples.testspace.com/spaces/676/schema/Static%20Analysis "Static Analysis (issues)")

***
In order to run this sample you will need a host workstation that supports the [Minitest test framework](http://docs.seattlerb.org/minitest/). 


Running Static Analysis: 

<pre>
bundle install
bundle exec rubocop --format emacs --out tmp/rubocop.txt || true
bundle exec brakeman -o tmp/brakeman.json
bundle exec brakeman_translate_checkstyle_format translate --file="tmp/brakeman.json" > tmp/brakeman_checkstyle.xml
bundle exec scss-lint --no-color --format=Stats --format=Default --out=tmp/scss-lint.txt  app/assets/stylesheets/ || true
</pre> 

Running Tests with Code Coverage: 

<pre>
export CI_REPORTS=$PWD/test/reports
bundle exec rake minitest test
</pre> 

Publishing Results using **Testspace**: 

<pre>
curl -s https://testspace-client.s3.amazonaws.com/testspace-linux.tgz | sudo tar -zxvf- -C /usr/local/bin
testspace @.testspace.txt $TESTSPACE_TOKEN/$GITHUB_ORG:$REPO_NAME/$BRANCH_NAME#$BUILD_NUMBER
</pre> 

Checkout the published [Test Content](https://samples.testspace.com/projects/testspace-samples:ruby.minitest). Note that the `.testspace.txt` file contains the [set of files](http://help.testspace.com/how-to:publish-content#publishing-via-content-list-file) to publish. 

***

To replicate this sample: 
  - Setup account at www.testspace.com.
  - Create a [CI Environment](http://help.testspace.com/how-to:add-to-ci) variable called **TESTSPACE_TOKEN**:
    -  `TESTSPACE_TOKEN` = `credentials@Your-Org-Name.testspace.com`
    - `credentials` set to `username:password` or your [access token](http://help.testspace.com/reference:client-reference#login-credentials).
