$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.2.14.0.exe'
  checksum      = 'AEBEB0FF354C1115EF7F02A43CFC44A3ED7370BD6FCFEEDF0B4378407C080239'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
