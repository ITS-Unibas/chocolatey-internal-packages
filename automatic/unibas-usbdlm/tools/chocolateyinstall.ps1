$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'USB Drive Letter Manager*'
  fileType       = 'MSI'
  url            = 'https://www.uwe-sieber.de/files/usbdlm_x64.msi'
  checksum       = 'f8fb7ce421b56c53b2a44a54eacf6741f39f83a971ce86f66745f5217da3bf08'
  checksumType   = 'sha256'
  silentArgs     = "/qn /norestart /l*v `"$env:SWP\Install_$env:ChocolateyPackageName_$env:ChocolateyPackageVersion.log`""
  validExitCodes = @(0, 3010)
}


Install-ChocolateyPackage @packageArgs
