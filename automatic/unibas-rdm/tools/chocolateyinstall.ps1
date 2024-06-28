$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.2.13.0.exe'
  checksum      = 'a9ef3cc84caa21c5bc60164216b4fa306b12031d67730225ba5c5982487d908a'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
