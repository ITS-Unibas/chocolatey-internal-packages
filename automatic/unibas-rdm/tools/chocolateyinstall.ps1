$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.2.20.0.exe'
  checksum      = '0670ecce2c6dab96193b1a7df889804f81e4e7b96558a45b65bdc515ab983284'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
