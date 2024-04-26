$ErrorActionPreference = 'Stop';

$packageName = 'unibas-advanced-renamer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://www.advancedrenamer.com/down/advanced_renamer_setup_3_95_4.exe'
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART"
  validExitCodes = @(0, 3010, 1641)
  softwareName   = 'unibas-advanced-renamer*'
  checksum       = '4bd2a54696c14380fceaff96e24a3297369d18e58d4df38deb63679c24bf6500'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
