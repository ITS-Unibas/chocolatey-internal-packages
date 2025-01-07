$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.3.25.0.exe'
  checksum      = 'e5097e8d4142b153c292070a6ba272bfb14fb94b9c9b0387dbd72e8116512151'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
