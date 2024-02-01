$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.3.39.0.exe'
  checksum      = 'a93d0b69a868af697eb39478968bba676c6d7433eca51668a332653631d4baae'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
