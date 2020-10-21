$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/78.4.0esr/win64/en-US/Firefox%20Setup%2078.4.0esr.msi'
  checksum      = '7395e3653c437fdcffac0799f7bc7c075000cbb3c93e346f52bc8586a87747e42893907cc2e2eee8dac4ba7f6b8435e356aa86954271ea884c2f40b695a94efe'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
