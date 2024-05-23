$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.1.30.0.exe'
  checksum      = '4ba09e54a5d84a4c1e45f78c2b78a5a92305dc22e21d53bcd8ce00ebeac831e7'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
