$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.2.27.0.exe'
  checksum      = '261ae2726a95bb921322008b0c0981fd2c42d15d61d024ef2d460201169d6911'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
