$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.1.22.0.exe'
  checksum      = '3a4d8abc0f3aeb5fba201e9156e3db5f7a47d0add1e278e115098bbdcafedcfa'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
