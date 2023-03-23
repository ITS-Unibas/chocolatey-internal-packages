$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.1.15.0.exe'
  checksum      = '79043880ac83979690d94114293fdad58a139ba69ddce4d8f3899faf2fd212eb'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
