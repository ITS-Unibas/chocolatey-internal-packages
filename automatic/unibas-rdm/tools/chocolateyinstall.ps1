$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.3.14.0.exe'
  checksum      = '03f93d243059bb20dc2f3688d5af498f7e97c85adc985c0186e8287eea5e943c'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
