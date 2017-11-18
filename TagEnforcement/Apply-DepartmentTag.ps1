#Authenticate to Azure
Login-AzureRmAccount

#Create new Azure Policy Definition
$policy = New-AzureRmPolicyDefinition -Name DepartmentPolicyDefinition -Description "Policy to deny resource without Department tag" -Policy "C:\scripts\AzureSecurityPolicy\DepartmentPolicyDefinition.json"

#Apply to subscription
New-AzureRmPolicyAssignment -Name DepartmentPolicyAssignment -Scope /subscriptions/$Subscription -PolicyDefinition $policy
