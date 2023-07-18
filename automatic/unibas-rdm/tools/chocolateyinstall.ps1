$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.2.17.0.exe'
  checksum      = 'b6a81adf6a28426def7082c2ff4f453069b65106e5e40c711f4653f195dc9b47'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
