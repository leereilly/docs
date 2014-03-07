---
title: Ruby
tags: ruby, languages
category: Languages and Frameworks
---

# Ruby

We use RVM to manage different Ruby versions. We set <strong>1.9.3-p327</strong> as the default version. Currently we do not load the Ruby version from your Gemfile. You can always change the Ruby version by running:

~~~shell
rvm use RUBY_VERSION_YOU_WANT_TO_USE
~~~

The following Ruby versions are preinstalled

## JRuby
1.7.4\\
1.7.5\\
1.7.6\\
1.7.8\\
1.7.10\\
1.7.11

## MRI 1.8.7
1.8.7-p374

## MRI 1.9.2
1.9.2-p320

## MRI 1.9.3
1.9.3-p194\\
1.9.3-p286\\
1.9.3-p327\\
1.9.3-p362\\
1.9.3-p374\\
1.9.3-p392\\
1.9.3-p429\\
1.9.3-p448\\
1.9.3-p484\\
1.9.3-p545

## MRI 2.0.0
2.0.0-p0\\
2.0.0-p195\\
2.0.0-p247\\
2.0.0-p353\\
2.0.0-p451

## MRI 2.1.0
2.1.0-p0

## MRI 2.1.1
2.1.1-p0

## Setting the Ruby version through a .ruby-version file
You can also use your .ruby-version file on the Codeship. The .ruby-version file lives in the project root and its content is just your Ruby version, for example: ```2.0.0-p195```. You can just read the ruby version to use from that file:

~~~shell
rvm use $(cat .ruby-version) --install
~~~

One use case is that you can change your Ruby version for different branches.

## Bundler
Bundler is preinstalled for all Ruby versions.

## Supported Test Frameworks
We support all Ruby based test frameworks from RSpec, Cucumber to minitest or others.

## Run with bundle exec
Make sure to run your commands with ```bundle exec``` (e.g. ```bundle exec rspec```) so all commands you run are executed with the versions of the ruby gems you configured in your Gemfile.lock

## Capybara
Capybara is supported out of the box with the selenium-webdriver , capybara-webkit or the poltergeist driver for phantomjs.
