$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.2.14.0.exe'
  checksum      = '3ca39e3b78089fafe4de1afc2afaa120c8310ca04f897a382d927cc6c3254972'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
