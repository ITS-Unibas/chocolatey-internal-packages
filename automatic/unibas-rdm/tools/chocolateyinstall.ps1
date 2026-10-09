$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.3.13.0.exe'
  checksum      = '4E03A5E14087EDE6FF8AACAD7BE87EE0960263076FB1ABE5BA7A191941BBDBE6'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
