$ErrorActionPreference = 'Stop';

$packageName = 'unibas-mobaxterm'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://download.mobatek.net/2362023122033030/MobaXterm_Installer_v23.6.zip'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes = @(0)
  softwareName   = 'unibas-mobaxterm*'
  checksum       = '6770bb1538143f530441e9de17583d99e5cb529ae54340f84de1f313f4081927'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
