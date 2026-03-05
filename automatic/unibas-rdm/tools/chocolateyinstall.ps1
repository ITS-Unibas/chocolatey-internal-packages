$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.1.10.0.exe'
  checksum      = '595df9ce30b0a43741e527ff5e063e1063aa441c14033ab32772a32115367bd1'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
