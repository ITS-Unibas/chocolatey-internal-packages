$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.3.16.0.exe'
  checksum      = 'f257d2cb20a1f59b6aab3bb3192a4dbeec668581db57b1ab43e9f189ec8ed425'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
