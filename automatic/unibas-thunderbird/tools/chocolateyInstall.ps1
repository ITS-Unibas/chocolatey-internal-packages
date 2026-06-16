$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageName  = 'unibas-thunderbird'
$softwareName = 'Mozilla Thunderbird'

$packageArgs = @{
  packageName = $packageName
  fileType = 'exe'
  softwareName = "$softwareName*"

  Checksum       = 'd4bc9db5eaedc3885802128124af8e1e9ce9926cf3c0cb0dc2b804c25d4e9b58'
  ChecksumType = 'sha256'
  Url = 'https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/140.12.0esr/win64/en-US/Thunderbird%20Setup%20140.12.0esr.exe'
  silentArgs     = '-ms'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
