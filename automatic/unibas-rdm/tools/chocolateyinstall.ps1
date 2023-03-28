$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.1.17.0.exe'
  checksum      = 'a09db013032bcb830fa44e5cb11b2263adf1a2e4ff93de2082e108535df1d16b'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
