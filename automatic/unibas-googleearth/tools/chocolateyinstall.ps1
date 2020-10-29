$ErrorActionPreference = 'Stop';

$packageName = 'unibas-googleearth'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin-7.3.3-x64.exe'
  silentArgs     = '/S OMAHA=1'
  validExitCodes = @(0)
  softwareName   = 'Google Earth*'
  checksum       = 'fe2711c7cb75455b52d7e4a6700be296fd567af607d5d43bfa8ba7451bb7c2b7'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
