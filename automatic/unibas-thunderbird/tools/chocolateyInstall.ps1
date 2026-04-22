$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageName  = 'unibas-thunderbird'
$softwareName = 'Mozilla Thunderbird'

$packageArgs = @{
  packageName = $packageName
  fileType = 'exe'
  softwareName = "$softwareName*"

  Checksum       = 'b30a9fdc301de0376f3278f44a2698803b486d61f8f9a7a49b62bec44de23836'
  ChecksumType = 'sha256'
  Url = 'https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/140.10.0esr/win64/en-US/Thunderbird%20Setup%20140.10.0esr.exe'
  silentArgs     = '-ms'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
