Puppet::Type.newtype(:mysql_database) do
  @doc = "Manage MySQL Databases."

  apply_to_device

  newparam(:name, :namevar => true) do
    desc "The MySQL Database name"
  end

  ensurable do
    desc "MySQL Database management. Valid values are present, absent."

    defaultto(:present)

    newvalue(:present) do
      provider.create
    end

    newvalue(:absent) do
      provider.destroy
    end
  end

end
