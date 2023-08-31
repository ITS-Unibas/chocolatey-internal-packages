$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.2.27.0.exe'
  checksum      = '2a59df6be20dad4d668a3860659b75e5fa91003f6ce25fa00ef824ca2f56753c'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
