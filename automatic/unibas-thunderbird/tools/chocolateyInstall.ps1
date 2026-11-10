$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageName  = 'unibas-thunderbird'
$softwareName = 'Mozilla Thunderbird'

$packageArgs = @{
  packageName = $packageName
  fileType = 'exe'
  softwareName = "$softwareName*"

  Checksum       = 'f0446fbcd8a85dc5c697b2dcd6b3c136840e48d5ef6a2990ee703fbbef0dcf36'
  ChecksumType = 'sha256'
  Url = 'https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/153.7.0esr/win64/en-US/Thunderbird%20Setup%20153.7.0esr.exe'
  silentArgs     = '-ms'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
