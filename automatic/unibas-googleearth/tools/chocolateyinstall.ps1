$ErrorActionPreference = 'Stop';

$packageName = 'unibas-googleearth'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin-7.3.4-x64.exe'
  silentArgs     = '/S OMAHA=1'
  validExitCodes = @(0)
  softwareName   = 'Google Earth*'
  checksum       = '25a53b44656f7d40a86a75dae64977c95ce99e59d523064a180e1fc8ec4b3439'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
