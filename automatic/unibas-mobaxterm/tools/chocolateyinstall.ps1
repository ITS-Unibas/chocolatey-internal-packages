$ErrorActionPreference = 'Stop';

$packageName = 'unibas-mobaxterm'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://download.mobatek.net/2352023111832715/MobaXterm_Installer_v23.5.zip'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes = @(0)
  softwareName   = 'unibas-mobaxterm*'
  checksum       = '715f1db3d326bce409893477c71f0c66e9786e25a7d58d3271c3977605f02308'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
