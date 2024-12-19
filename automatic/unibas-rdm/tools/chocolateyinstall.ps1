$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.3.22.0.exe'
  checksum      = '72c8608adccd2c8152436e5d35748d322cd5e89a578955bc65c868cd442cc8d7'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
