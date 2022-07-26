$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/102.1.0esr/win64/en-US/Firefox%20Setup%20102.1.0esr.msi'
  checksum      = 'e7e2a3755b08d29836e835eba78a0f72f8b7a0bc58c0ab107398b6e122e9093ab16d7cc9b834f8e7c588277434d571ab4631c65781794a1e09d4aa7a4561558a'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
