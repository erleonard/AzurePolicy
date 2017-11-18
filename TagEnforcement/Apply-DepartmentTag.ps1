#Authenticate to Azure
Login-AzureRmAccount

#Get azure subscription information
$Subscription = Get-AzureRmSubscription

#Create new Azure Policy Definition
$policy = New-AzureRmPolicyDefinition -Name DepartmentPolicyDefinition -Description "Policy to deny resource without Department tag" -Policy "https://raw.githubusercontent.com/erleonard/AzurePolicy/master/TagEnforcement/EnforceDepartmentTag.json"

#Apply to subscription
New-AzureRmPolicyAssignment -Name DepartmentPolicyAssignment -Scope /subscriptions/$Subscription -PolicyDefinition $policy
