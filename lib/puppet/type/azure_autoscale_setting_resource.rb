require "puppet/parameter/boolean"

Puppet::Type.newtype(:azure_autoscale_setting_resource) do
  @doc = "The autoscale setting resource."

  ensurable

  validate do
    required_properties = [
      :location,
      :properties,
      :autoscale_setting_name,
      :parameters,
      :resource_group_name,
    ]
    required_properties.each do |property|
      # We check for both places so as to cover the puppet resource path as well
      if self[:ensure] == :present && self[property].nil? && self.provider.send(property) == :absent
        raise Puppet::Error, "In azure_autoscale_setting_resource you must provide a value for #{property}"
      end
    end
  end
  newproperty(:id) do
    desc "Azure resource Id"
    validate do |value|
      true
    end
  end
  newproperty(:location) do
    desc "Resource location"
    validate do |value|
      true
    end
  end
  newparam(:name) do
    isnamevar
    desc "Azure resource name"
    validate do |value|
      true
    end
  end
  newproperty(:properties) do
    desc "The autoscale setting of the resource."
    validate do |value|
      true
    end
  end
  newproperty(:tags) do
    desc "Resource tags"
    validate do |value|
      true
    end
  end
  newproperty(:type) do
    desc "Azure resource type"
    validate do |value|
      true
    end
  end
  newparam(:api_version) do
    desc "Client Api Version."
    validate do |value|
      true
    end
  end
  newparam(:autoscale_setting_name) do
    desc "The autoscale setting name."
    validate do |value|
      true
    end
  end
  newparam(:parameters) do
    desc "Parameters supplied to the operation."
    validate do |value|
      true
    end
  end
  newparam(:resource_group_name) do
    desc "The name of the resource group."
    validate do |value|
      true
    end
  end
  newparam(:subscription_id) do
    desc "The Azure subscription Id."
    validate do |value|
      true
    end
  end
end
