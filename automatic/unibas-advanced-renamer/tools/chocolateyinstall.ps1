$ErrorActionPreference = 'Stop';

$packageName = 'unibas-advanced-renamer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://www.advancedrenamer.com/down/advanced_renamer_setup_3_94_3.exe'
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART"
  validExitCodes = @(0, 3010, 1641)
  softwareName   = 'unibas-advanced-renamer*'
  checksum       = 'f9d4c6875f458eddb83adc2ed9b7a9f5527574240e95e0593bdf7a4ceb887a66'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
