$base_name        = 'ENTER_BASE_NAME_HERE'
$rg               = "${base_name}-rg"
$location         = 'uksouth'
$mc               = "${base_name}-mc"
$client_id        = 'YOUR_CLIENT_ID'
$subscription_id  = 'YOUR_SUBSCRIPTION_ID'
$secret_id        = 'YOUR SECRET_ID'

azure_managed_cluster { "$mc":
  ensure     => present,
  location   => $location,
  resource_group_name => $rg,
  resource_name => "$mc",
  parameters => {},
  properties => {
  kubernetesVersion => '1.10.3',
  dnsPrefix => "$mc",
  agentPoolProfiles => [
    {
      name => 'agentpool',
      count => 3,
      vmSize => 'Standard_DS1_v2',
      storageProfile => 'ManagedDisks',
      maxPods => 110,
      osType => 'Linux'
    }],
  servicePrincipalProfile => {
    clientId => $client_id,
    secret   => $secret_id
  },
  addonProfiles => {
    httpApplicationRouting => {
      enabled => true,
    },
    omsagent => {
      enabled => true,
       config => {
        logAnalyticsWorkspaceResourceID => "/subscriptions/${subscriptions_id}/resourcegroups/defaultresourcegroup-suk/providers/microsoft.operationalinsights/workspaces/defaultworkspace-${subscriptions_id}-suk"
      }
    }
  },
  enableRBAC => false,
  networkProfile => {
    networkPlugin => 'kubenet',
  }
},
}