$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'USBDLM*'
  fileType       = 'MSI'
  url            = 'https://www.uwe-sieber.de/files/usbdlm_x64.msi'
  checksum       = '9342fb9d9a86f8016b45ddeb8fc9d2a588b4ecbec6a9809b74b7fd0dd4438eac'
  checksumType   = 'sha256'
  silentArgs     = "/qn /norestart /l*v `"$env:SWP\Install_$env:ChocolateyPackageName_$env:ChocolateyPackageVersion.log`""
  validExitCodes = @(0, 3010)
}


Install-ChocolateyPackage @packageArgs
