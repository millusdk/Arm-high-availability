Param(
	[parameter(Mandatory=$true)]
	$ResourceGroupName,
	[parameter(Mandatory=$true)]
	$StorageAccountName
)

Get-AzureRmResourceGroup -Name $ResourceGroupName -ErrorVariable NotPresent -ErrorAction 0

if($NotPresent) {
   New-AzureRmResourceGroup -Name $ResourceGroupName -Location "West Europe"
}

Get-AzureRmStorageAccount -Name $StorageAccountName -ResourceGroupName $ResourceGroupName -ErrorVariable NotPresent -ErrorAction 0

if($NotPresent) {
   New-AzureRmStorageAccount -Name $StorageAccountName -ResourceGroupName $ResourceGroupName -Location "West Europe" -SkuName Standard_LRS
}