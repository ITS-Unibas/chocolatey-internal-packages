$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/115.1.0esr/win64/en-US/Firefox%20Setup%20115.1.0esr.msi'
  checksum      = 'd00f84dac4abcf258b77ba5bfa9feab84fefdddb80e5326b789592654137130a74130749004c65f567f2b9ca3100cb7a7b950210f690d922efd6c2f18bf5106d'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
