$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.3.31.0.exe'
  checksum      = '86847b4e9f5e0938e2b6bbd933cd1021d8c5519d3a93c2a79f4a56c2878fd69c'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
