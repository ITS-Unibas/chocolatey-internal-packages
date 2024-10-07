$ErrorActionPreference = 'Stop';

$packageName = 'nis-elements-viewer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://www.software-dl.microscope.healthcare.nikon.com/en/imgsfw/data/NIS_Viewer_Ver52200_E.zip'
  silentArgs     = "/s /sms /f1C:\temp\setup.iss /f2c:\temp\install.txt" # s: silent, sms: wait for process, f1: import setup.iss-file for silent install, f2: install-log
  softwareName   = 'NIS-Elements viewer*' 
  checksum       = 'd80b02e6f7bc96a81621a665c3a2ef693c188aaa562e21505e486c6dd4dcde8b'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
