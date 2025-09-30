$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.2.30.0.exe'
  checksum      = '4a8b2de8e3dcf63855c715d112e59bec277fb36417ccc2e7f7ef97454c1ed91e'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
