$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.2.14.0.exe'
  checksum      = '8f677916280e0d13b3274bf7c7b3329699fec9f72dd1475cea9a1e273a0b9867'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
