$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.1.17.0.exe'
  checksum      = 'c2db8a33030baa52c2f98a6891d96654cc4aa207308d064057f33d50c4e94354'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
