require 'puppet/util/network_device'
require 'puppet/util/network_device/transport'
require 'puppet/util/network_device/transport/base'
require 'rubygems'
require 'sequel'

class Puppet::Util::NetworkDevice::Transport::Sequel < Puppet::Util::NetworkDevice::Transport::Base

  def initialize(url, verbose = false)
    super()

    @url     = url
    @verbose = verbose
  end

  def connect
  end

  def sequel
    @sequel = Sequel.connect(@url.to_s)
  end

  def close
    @sequel = nil
  end

end
