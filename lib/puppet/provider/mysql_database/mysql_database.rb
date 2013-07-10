require 'puppet/provider/mysql'

Puppet::Type.type(:mysql_database).provide(:mysql_database, :parent => Puppet::Provider::Mysql) do
  @doc = "Manages MySQL Databases"

  def create
    Puppet.debug("Puppet::Provider::Mysql_Database: creating #{resource[:name]}")
    transport.sequel.run("CREATE DATABASE #{resource[:name]}")
  end

  def destroy
    Puppet.debug("Puppet::Provider::Mysql_Database: destroying #{resource[:name]}")
    transport.sequel.run("DROP DATABASE #{resource[:name]}")
  end

  def exists?
   ! transport.sequel[:schemata].select(:SCHEMA_NAME).where( :SCHEMA_NAME => resource[:name] ).to_a.empty?
  end

end
