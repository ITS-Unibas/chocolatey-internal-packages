$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.2.33.0.exe'
  checksum      = '73af101fb6d4c149075495711b85f7476aa380543538017a37481891acd00d86'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
