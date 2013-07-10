# Puppet MySQL Device #

Ever wanted to manage a MySQL server that you couldn't install an agent
on? With this Puppet device you can.

Warning: this code is at a very early stage and both lacks tests and a
nicely abstracted interface to the available MySQL connection libraries.
These will be fixed as my needs change. It's mostly for people that are
already familliar with Puppet devices at this stage

## How is this different to using a normal type?

All the MySQL types I've seen work against a local MySQL that's
installed on the same machine as the puppet agent. We use a lot of
Amazon Web Services RDS instances and so needed a different way to
control their running state. (and use cloud formation for the more static
configuration)

## Installation

Installing a puppet device is a little more complicated that using a
normal module.

Until I write up full installation docs you can find examples -

 * [Managing F5 BIG-IP Network Devices with Puppet](https://puppetlabs.com/blog/managing-f5-big-ip-network-devices-with-puppet/)
 * [Puppet Network Device Management](http://puppetlabs.com/blog/puppet-network-device-management/)

## Basic Usage

As an example usage, once you've installed the device module, add the
below to your site.pp -

    node 'mysql.udlabs.priv' {
        mysql_database { 'bar': ensure => 'present' }
    }

Create the configuration directory `mkdir /etc/puppet/devices.d/` and
then add the configuration for this devices endpoint -

    $ cat /etc/puppet/devices.d/ud-textmysql.conf
    [mysql.udlabs.priv]
    type mysql
    url mysql://localhost/information_schema?user=pupuser&password=puptest

## Known Limitations
 * requires the sequel rubygem
 * has no error handling yet
 * very early stage of existence
 * The puppet master must be able to connect to the running database instance.
