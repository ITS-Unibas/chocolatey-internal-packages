$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.1.29.0.exe'
  checksum      = '3862c4c83a152c52e33a4fc0dc742a1843061924444265dc6ffd5bbe13d8124a'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
