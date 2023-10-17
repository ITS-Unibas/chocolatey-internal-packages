$ErrorActionPreference = 'Stop';

$packageName = 'unibas-advanced-renamer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://www.advancedrenamer.com/down/advanced_renamer_setup_3_91.exe'
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART"
  validExitCodes = @(0, 3010, 1641)
  softwareName   = 'unibas-advanced-renamer*'
  checksum       = '7ac9d6e6d8fabdee7152c2506315b4a849dc203927586661e2f4addbf7582759'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
