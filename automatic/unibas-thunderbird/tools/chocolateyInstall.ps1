$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageName  = 'unibas-thunderbird'
$softwareName = 'Mozilla Thunderbird'

$packageArgs = @{
  packageName = $packageName
  fileType = 'exe'
  softwareName = "$softwareName*"

  Checksum       = '2c7797ab0c0a2b8c3dfdaabc9a2555e54b77ca8f0855586b56d7361bad0e8425'
  ChecksumType = 'sha256'
  Url = 'https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/140.11.0esr/win64/en-US/Thunderbird%20Setup%20140.11.0esr.exe'
  silentArgs     = '-ms'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
