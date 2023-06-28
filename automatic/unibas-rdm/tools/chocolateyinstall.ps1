$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.2.12.0.exe'
  checksum      = '3f34f4253e9b8cedd7d81c28f073d5b61f743ffe567e6e159d7d8d33e55a737a'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
