$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.1.14.0.exe'
  checksum      = '0b7034c554ea6e47fdefa33dc6ac37b949072eb890a6a83ce6a1e3708e508d66'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
