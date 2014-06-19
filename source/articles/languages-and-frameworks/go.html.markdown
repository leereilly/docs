---
title: Go
tags: go, languages
category: Languages and Frameworks
---

# Go

We have Go 1.3 installed on in our virtual machine

We set the ```GOPATH``` to /home/rof and checkout your code into

~~~shell
/home/rof/src/github.com/GITHUB_USER_NAME/GITHUB_REPOSITORY_NAME
~~~

## Dependency management

You can install dependencies with:

~~~shell
go get
~~~

## Testing

You can run your tests with:

~~~shell
go test -v
~~~

You can of course use different test frameworks as well, for example gocheck

~~~shell
go get launchpad.net/gocheck
go test -gocheck.v
~~~

## Build

You can build your Go project with

~~~shell
go build
~~~
