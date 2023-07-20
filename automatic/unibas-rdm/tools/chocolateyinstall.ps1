$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.2.18.0.exe'
  checksum      = 'b03c72d3b823cd30900ff8e930e80a0b91a707a483de47a6559de0d04fefcd7a'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
