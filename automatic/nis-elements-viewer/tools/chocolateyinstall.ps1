$ErrorActionPreference = 'Stop';

$packageName = 'nis-elements-viewer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://d33b8x22mym97j.cloudfront.net/phase5/files/downloads/NIS_Viewer_5.21.00_b1483_64bit.zip'
  silentArgs     = "/s /sms /f1C:\temp\setup.iss /f2c:\temp\install.txt" # s: silent, sms: wait for process, f1: import setup.iss-file for silent install, f2: install-log
  softwareName   = 'NIS-Elements viewer*' 
  checksum       = '82dfc2dd6419c4c4ffc9eb81ea4b58c2296528fa3a0c5ec5c3505402afbcf989'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
