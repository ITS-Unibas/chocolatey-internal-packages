$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.3.33.0.exe'
  checksum      = 'f33d3260d8201ebc1a135e843b54abcbe1c9769627f2dbad40aa30d22e41a454'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
