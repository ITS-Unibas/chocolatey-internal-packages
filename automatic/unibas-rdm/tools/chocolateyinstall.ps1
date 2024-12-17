$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.3.21.0.exe'
  checksum      = 'a9ad770cabefb59cb6bc901c851a95a8e66b9c6b9376b36e8d7113f58d7acfee'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
