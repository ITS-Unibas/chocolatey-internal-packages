$ErrorActionPreference = 'Stop';

$packageName = 'unibas-advanced-renamer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://www.advancedrenamer.com/down/win/advanced_renamer_setup_4_14.exe'
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART"
  validExitCodes = @(0, 3010, 1641)
  softwareName   = 'unibas-advanced-renamer*'
  checksum       = '1f6284821525eef938fcd8469c3b5573cdfee01911f115405773bb087673f217'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
