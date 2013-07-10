require 'puppet/util/network_device/mysql'

class Puppet::Util::NetworkDevice::Mysql::Facts
    
  attr_reader :transport

  def initialize(transport)
    @transport = transport
  end

  def retrieve
    @facts = {}

    @facts['stub'] = 'stub fact'
    @facts['databases'] = get_databases

    require 'pp'
    pp @facts

    @facts
  end


  def get_databases
    databases = @transport.sequel[:schemata].select(:SCHEMA_NAME).collect { | r | r[:SCHEMA_NAME] }
    databases.sort.join(',')
  end
end
