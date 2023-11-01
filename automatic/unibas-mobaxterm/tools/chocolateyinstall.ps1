$ErrorActionPreference = 'Stop';

$packageName = 'unibas-mobaxterm'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://download.mobatek.net/2342023101450418/MobaXterm_Installer_v23.4.zip'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes = @(0)
  softwareName   = 'unibas-mobaxterm*'
  checksum       = 'f38b58b309b650981854b0639b531dcfb00123699c969a85d53d2f5095b86a60'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
