$ErrorActionPreference = 'Stop';

$packageName = 'unibas-mobaxterm'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://download.mobatek.net/2332023092000531/MobaXterm_Installer_v23.3.zip'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes = @(0)
  softwareName   = 'unibas-mobaxterm*'
  checksum       = '4021ce8311fe88afeabcc677981294a79d4c8c744c583cfcc6c75453cfae05cc'
  checksumType   = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
