$ErrorActionPreference = 'Stop';

$packageName = 'switchdrive'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'msi'
  url            = 'https://drive.switch.ch/index.php/s/pdo2r7tbdwRHWq6/download'
  silentArgs     = 'MSIRESTARTMANAGERCONTROL=Disable ALLUSERS=1 REBOOT=ReallySuppress /qn'
  validExitCodes = @(0)
  softwareName   = 'SWITCHdrive*'
  checksum       = 'ebb59a45ccd3f8e65cfbd1cc3674a17e48158ff54b5373a0d3fa81bdee7ff337'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
