$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.1.28.0.exe'
  checksum      = '8d02335c59df8b65ceda10420db501b606a782132e81eab47d659dbae84e0e7b'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
