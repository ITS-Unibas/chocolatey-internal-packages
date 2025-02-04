$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.3.28.0.exe'
  checksum      = 'adc939907296e70ad4dfecdf726dac5b9bd11bc9285fd683584dd3a35fc9fc22'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
