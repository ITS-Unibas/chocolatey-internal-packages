$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.1.26.0.exe'
  checksum      = '38851d29d8cf92f758746812d8e84ea2c910d0e246ea2bf61b1e8c92cced04e6'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
