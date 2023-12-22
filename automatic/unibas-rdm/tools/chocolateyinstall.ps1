$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.3.35.0.exe'
  checksum      = 'ee75ab84e984c4a6ea2dacd798bd7fc45786d8b520416f226319cc660e4a9e6d'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
