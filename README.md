[![Testspace](http://www.testspace.com/public/img/testspace_logo.png)](http://www.testspace.com)
***

## Ruby/Minitest sample for demonstrating Testspace 

This is the sample application for the [*Ruby on Rails Tutorial: Learn Web Development with Rails*](http://www.railstutorial.org/) by [Michael Hartl](http://www.michaelhartl.com/). It is being used to demonstrate Testspace usage models for easier test content management. 

[![Build Status](https://travis-ci.org/testspace-samples/ruby.minitest.svg?branch=master)](https://travis-ci.org/testspace-samples/ruby.minitest)
[![Space Health](https://samples.testspace.com/projects/85/spaces/288/badge)](https://samples.testspace.com/projects/85/spaces/288 "Test Cases")
[![Space Metric](https://samples.testspace.com/projects/85/spaces/288/metrics/183/badge)](https://samples.testspace.com/projects/85/spaces/288/metrics#metric-183 "Line/Statement Coverage")

***

We made a few minor modifications for reporting purposes. In order to run this sample you will need a host workstation that supports the [Minitest test framework](http://docs.seattlerb.org/minitest/). 

Publishing results example: 

<pre>
  bundle exec rake minitest test
  testspace publish [Tests]test/reports/TEST*.xml{test} coverage/coverage.xml
</pre> 

Checkout the [Space](https://samples.testspace.com/projects/ruby/spaces/minitest). 

***

To fork this example using Travis requires:
  - Account at www.testspace.com.
  - Travis Environment Variable: 
    - `TESTSPACE_URL` = `credentials:@my-org-name.testspace.com/my-project/my-space`
    - `credentials` set to `username:password` or your [access token](http://help.testspace.com/using-your-organization:user-settings).
    - `my-org-name.testspace.com/my-project/my-space` based on your subdomain, project, and space names. Refer [here](http://help.testspace.com/reference:runner-reference#login-credentials) for more details. 
    