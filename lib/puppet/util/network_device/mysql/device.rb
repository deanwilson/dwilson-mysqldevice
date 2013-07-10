require 'puppet/util'
require 'puppet/util/network_device/base'
require 'puppet/util/network_device/transport/sequel'


require 'puppet/util/network_device'
require 'puppet/util/network_device/mysql/facts'
require 'uri'

class Puppet::Util::NetworkDevice::Mysql::Device

  attr_accessor :transport

  def initialize(url, option = {})
    @url    = URI.parse(url)
    @option = option
            
    # TODO - hide password?
    Puppet.debug("Puppet::Device::MySQL: connecting to MySQL #{@url}")

    @transport ||= Puppet::Util::NetworkDevice::Transport::Sequel.new(@url)
  end

  def facts
    @facts ||= Puppet::Util::NetworkDevice::Mysql::Facts.new(@transport)

    @facts.retrieve
  end
end
