$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.2.18.0.exe'
  checksum      = 'caa377bb11a0b20cd4b51342444a40a20dbd86f9b3c7508a80c15218ebf4ca4f'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
