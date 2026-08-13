$ErrorActionPreference = 'Stop';

$packageName = 'switchdrive'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'msi'
  url            = 'https://drive.switch.ch/index.php/s/Sfb9ybAntNJsbZ4/download'
  silentArgs     = 'MSIRESTARTMANAGERCONTROL=Disable ALLUSERS=1 REBOOT=ReallySuppress /qn'
  validExitCodes = @(0)
  softwareName   = 'SWITCHdrive*'
  checksum       = 'b4da77d1a4c473afbed4a855b339664ec956df17420bb83d8ce878ee2841f679'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
