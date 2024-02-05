#Genero grupo de recursos
New-AzResourceGroup -Name 'myResourceGroup' -Location 'EastUS'

#Genero configuracion basica de VM
New-AzVm `
    -ResourceGroupName 'myResourceGroup' `
    -Name 'mymaquina' `
    -Location 'EastUS' `
    -Image 'MicrosoftWindowsServer:WindowsServer:2022-datacenter-azure-edition:latest' `
    -VirtualNetworkName 'myVnet' `
    -SubnetName 'mySubnet' `
    -SecurityGroupName 'myNetworkSecurityGroup' `
    -PublicIpAddressName 'myPublicIpAddress' `
    -OpenPorts 80,3389


#Ejecuto script para IIS Microsoft
Invoke-AzVMRunCommand -ResourceGroupName 'myResourceGroup' -VMName 'mymaquina' -CommandId 'RunPowerShellScript' -ScriptString 'Install-WindowsFeature -Name Web-Server -IncludeManagementTools'