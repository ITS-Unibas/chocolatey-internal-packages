$ErrorActionPreference = 'Stop';

$packageName = 'unibas-mobaxterm'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://download.mobatek.net/2362023122033030/MobaXterm_Installer_v23.6.zip'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes = @(0)
  softwareName   = 'unibas-mobaxterm*'
  checksum       = 'b1ccdd8a6596cf723acd7c6636387447c735feaf28a480c836fd25df953544d9'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
