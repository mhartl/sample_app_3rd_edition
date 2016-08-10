source 'https://rubygems.org'

gem 'rails',                   '4.2.2'
gem 'bcrypt',                  '3.1.7'
gem 'faker',                   '1.4.2'
gem 'carrierwave',             '0.10.0'
gem 'mini_magick',             '3.8.0'
gem 'fog',                     '1.36.0'
gem 'will_paginate',           '3.0.7'
gem 'bootstrap-will_paginate', '0.0.10'
gem 'bootstrap-sass',          '3.2.0.0'
gem 'sass-rails',              '5.0.2'
gem 'uglifier',                '2.5.3'
gem 'coffee-rails',            '4.1.0'
gem 'jquery-rails',            '4.0.3'
gem 'turbolinks',              '2.3.0'
gem 'jbuilder',                '2.2.3'
gem 'sdoc',                    '0.4.0', group: :doc

group :development, :test do
  gem 'sqlite3',     '1.3.9'
  #gem 'byebug',      '3.4.0'
  gem 'pry-byebug', platform: [:ruby_20]
  gem 'web-console', '2.0.0.beta3'
  gem 'spring',      '1.1.3'
  
   # A Ruby static code analyzer.
  gem 'rubocop', :require => false
  # A Rubocop formatter that outputs in Checkstyle format.
  gem 'rubocop-checkstyle_formatter', :require => false
  # A static analysis security vulnerability scanner for Ruby on Rails.
  gem 'brakeman', :require => false
  # Translate brakeman json format into Checkstyle format.
  gem 'brakeman_translate_checkstyle_format', :require => false
  # Configurable tool for writing clean and consistent SCSS.
  gem 'scss_lint', require: false
  # Checkstyle formatter for SCSS Lint.
  gem 'scss_lint_reporter_checkstyle', require: false
end

group :test do
  gem 'minitest-reporters', '1.0.5'
  gem 'mini_backtrace',     '0.1.3'
  gem 'guard-minitest',     '2.3.1'
  # Sample stuff
  gem 'ci_reporter_minitest'
  gem 'simplecov'
  gem 'simplecov-cobertura'
end

group :production do
 # gem 'pg',             '0.17.1'
  gem 'rails_12factor', '0.0.2'
  gem 'puma',           '3.1.0'
end
