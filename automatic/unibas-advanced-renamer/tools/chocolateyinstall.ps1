$ErrorActionPreference = 'Stop';

$packageName = 'unibas-advanced-renamer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://www.advancedrenamer.com/down/win/advanced_renamer_setup_4_16.exe'
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART"
  validExitCodes = @(0, 3010, 1641)
  softwareName   = 'unibas-advanced-renamer*'
  checksum       = '5d4a863ff2fcba653067dbf344c1252b66f565bc6c311b03e920e272726d65a2'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
