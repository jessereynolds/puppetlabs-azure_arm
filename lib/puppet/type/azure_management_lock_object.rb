require "puppet/parameter/boolean"

Puppet::Type.newtype(:azure_management_lock_object) do
  @doc = "The lock information."

  ensurable

  validate do
    required_properties = [
      :properties,
      :lock_name,
      :parameters,
      :parent_resource_path,
      :resource_group_name,
      :resource_name,
      :resource_provider_namespace,
      :resource_type,
      :scope,
    ]
    required_properties.each do |property|
      # We check for both places so as to cover the puppet resource path as well
      if self[:ensure] == :present && self[property].nil? && self.provider.send(property) == :absent
        raise Puppet::Error, "In azure_management_lock_object you must provide a value for #{property}"
      end
    end
  end
  newproperty(:id) do
    desc "The resource ID of the lock."
    validate do |value|
      true
    end
  end
  newparam(:name) do
    isnamevar
    desc "The name of the lock."
    validate do |value|
      true
    end
  end
  newproperty(:properties) do
    desc "The properties of the lock."
    validate do |value|
      true
    end
  end
  newproperty(:type) do
    desc "The resource type of the lock - Microsoft.Authorization/locks."
    validate do |value|
      true
    end
  end
  newparam(:api_version) do
    desc "The API version to use for the operation."
    validate do |value|
      true
    end
  end
  newparam(:lock_name) do
    desc "The name of lock. The lock name can be a maximum of 260 characters. It cannot contain <, > %, &, :, \, ?, /, or any control characters."
    validate do |value|
      true
    end
  end
  newparam(:parameters) do
    desc "Parameters for creating or updating a  management lock."
    validate do |value|
      true
    end
  end
  newparam(:parent_resource_path) do
    desc "The parent resource identity."
    validate do |value|
      true
    end
  end
  newparam(:resource_group_name) do
    desc "The name of the resource group containing the resource to lock. "
    validate do |value|
      true
    end
  end
  newparam(:resource_name) do
    desc "The name of the resource to lock."
    validate do |value|
      true
    end
  end
  newparam(:resource_provider_namespace) do
    desc "The resource provider namespace of the resource to lock."
    validate do |value|
      true
    end
  end
  newparam(:resource_type) do
    desc "The resource type of the resource to lock."
    validate do |value|
      true
    end
  end
  newparam(:scope) do
    desc "The scope for the lock. When providing a scope for the assignment, use '/subscriptions/{subscriptionId}' for subscriptions, '/subscriptions/{subscriptionId}/resourcegroups/{resourceGroupName}' for resource groups, and '/subscriptions/{subscriptionId}/resourcegroups/{resourceGroupName}/providers/{resourceProviderNamespace}/{parentResourcePathIfPresent}/{resourceType}/{resourceName}' for resources."
    validate do |value|
      true
    end
  end
  newparam(:subscription_id) do
    desc "The ID of the target subscription."
    validate do |value|
      true
    end
  end
end
