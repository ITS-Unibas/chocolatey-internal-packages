$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'USB Drive Letter Manager*'
  fileType       = 'MSI'
  url            = 'https://www.uwe-sieber.de/files/usbdlm_x64.msi'
  checksum       = 'e959bb8f46caec9d592e0a5b39352f0f25257437febbfe28808ed87a4df95628'
  checksumType   = 'sha256'
  silentArgs     = "/qn /norestart /l*v `"$env:SWP\Install_$env:ChocolateyPackageName_$env:ChocolateyPackageVersion.log`""
  validExitCodes = @(0, 3010)
}


Install-ChocolateyPackage @packageArgs
