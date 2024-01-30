$ErrorActionPreference = 'Stop';

$packageName = 'switchdrive'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'msi'
  url            = 'https://drive.switch.ch/index.php/s/z3SK7JuXtG0fk5C/download'
  silentArgs     = 'MSIRESTARTMANAGERCONTROL=Disable ALLUSERS=1 REBOOT=ReallySuppress /qn'
  validExitCodes = @(0)
  softwareName   = 'SWITCHdrive*'
  checksum       = '0fc3fd850d564fa50ca54a565f194eaa9f591cc56735edc5fe2f72545722c52c'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
