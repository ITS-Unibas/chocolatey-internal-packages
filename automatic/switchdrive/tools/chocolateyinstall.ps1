$ErrorActionPreference = 'Stop';

$packageName = 'switchdrive'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'msi'
  url            = 'https://download.to.switch.ch/59.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)

  softwareName   = 'SWITCHdrive*'
  checksum       = 'dd4f6f4ddcf09494b5134d90bc40bb59'
  checksumType   = 'md5'
}

Install-ChocolateyPackage @packageArgs
