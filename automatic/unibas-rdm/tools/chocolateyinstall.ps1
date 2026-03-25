$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.1.15.0.exe'
  checksum      = '0f105f76529d263a45781d1feb9e968773227e70bad4042584c403542c1ec953'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
