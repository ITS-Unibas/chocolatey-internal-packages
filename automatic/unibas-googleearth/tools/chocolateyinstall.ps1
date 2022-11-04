$ErrorActionPreference = 'Stop';

$packageName = 'unibas-googleearth'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin-7.3.6-x64.exe'
  silentArgs     = '/S OMAHA=1'
  validExitCodes = @(0)
  softwareName   = 'Google Earth*'
  checksum       = '48a8f9b18002d415e49cbd455f0ed1b0c130b1f102ea8adbfbe44c59e728e002'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
