$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.2.18.0.exe'
  checksum      = 'BA11023337920A9B8E77F7F4717224AE93B10CEED4EE80A30C51F4D80EDBBCDE'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
