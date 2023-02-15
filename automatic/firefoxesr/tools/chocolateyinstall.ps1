$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/102.8.0esr/win64/en-US/Firefox%20Setup%20102.8.0esr.msi'
  checksum      = '17d991b64d762bf35d476c9fe35bec5084e996e7b1767bbc81bd62696ffc842ac1e2b450fcb0025fb972a5051bf9974861de4ca7b3cf5a407d7be9702c373582'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
