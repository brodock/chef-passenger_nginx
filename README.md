# Passenger Nginx cookbook

# Requirements

## Supported Platforms

* Ubuntu
* Debian

## Cookbook Dependencies

This cookbook depends on the following:

* apt

## Rubies

This recipe can work with any ruby installed. As from passenger 4.0 it
does work with multiple rubies installed on system. All you have to do
is configure the right parameters for the desired version.

# Usage

Just use the default recipe and you will have passenger installed
with nginx by the phusion's repository.

By default it will always upgrade to the latest version.

# Attributes

* `node[:passenger_nginx][:auto_upgrade]` = true

# Recipes

* `passenger_nginx::default` 

# Author

Author:: Gabriel Mazetto  (<brodock@gmail.com>)
