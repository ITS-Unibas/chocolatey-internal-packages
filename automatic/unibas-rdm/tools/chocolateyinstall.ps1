$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.3.17.0.exe'
  checksum      = 'dc5f0576a78b7d75c451a8f70d52330d63b49b95c6c619e9020effefaa6748e2'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
