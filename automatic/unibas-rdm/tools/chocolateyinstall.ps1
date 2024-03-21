$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.1.19.0.exe'
  checksum      = 'e1000e751c7e5f71ae8b536938546bac1e6a578dc2bcc17048cb99517543cc2e'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
