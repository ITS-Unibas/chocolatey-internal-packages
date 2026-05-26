$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.1.23.0.exe'
  checksum      = 'B9C1DF6F48565FE418968038C667319D637DE37FFCB02CAEE6905B6C55A8E370'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
