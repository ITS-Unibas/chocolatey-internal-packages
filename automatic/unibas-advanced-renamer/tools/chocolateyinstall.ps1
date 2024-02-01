$ErrorActionPreference = 'Stop';

$packageName = 'unibas-advanced-renamer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://www.advancedrenamer.com/down/advanced_renamer_setup_3_93_3.exe'
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART"
  validExitCodes = @(0, 3010, 1641)
  softwareName   = 'unibas-advanced-renamer*'
  checksum       = 'e50b90699a7fe57dbd5a569ae15b7762e2252b430ca87d81d009682889ae1073'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
