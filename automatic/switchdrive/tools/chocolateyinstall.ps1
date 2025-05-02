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
  checksum       = '5d3afba7fa6597d5327b5b1301faffa1ef650e92b57ca5bb08c389a93bcc0f6d'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
