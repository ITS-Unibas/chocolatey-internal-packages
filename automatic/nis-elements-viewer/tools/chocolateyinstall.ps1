$ErrorActionPreference = 'Stop';

$packageName = 'nis-elements-viewer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = ''
  silentArgs     = "/s /sms /f1C:\temp\setup.iss /f2c:\temp\install.txt" # s: silent, sms: wait for process, f1: import setup.iss-file for silent install, f2: install-log
  softwareName   = 'NIS-Elements viewer*' 
  checksum       = ''
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
