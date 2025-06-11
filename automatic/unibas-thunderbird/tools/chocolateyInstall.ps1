$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageName  = 'unibas-thunderbird'
$softwareName = 'Mozilla Thunderbird'

$packageArgs = @{
  packageName = $packageName
  fileType = 'exe'
  softwareName = "$softwareName*"

  Checksum       = '28c04f170ee7eddde667ce808b2fb2b415ddcaedfd423a7b7dfa9f4c900870b9'
  ChecksumType = 'sha256'
  Url = 'https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/128.11.1esr/win64/en-US/Thunderbird%20Setup%20128.11.1esr.exe'
  silentArgs     = '-ms'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
