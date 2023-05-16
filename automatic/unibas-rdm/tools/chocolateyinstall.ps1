$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.1.27.0.exe'
  checksum      = '1f609b0cc535d11b17d61c8cb51524e001f627c2597a6391132ab74c9965f1c0'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
