$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.1.39.0.exe'
  checksum      = 'fd7f2c5bd94ffec9af2833bfc02eb145b1ba1dfb99573a824ae688970eff88fe'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
