$ErrorActionPreference = 'Stop';

$packageName = 'unibas-obs-studio'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit          = 'https://github.com/obsproject/obs-studio/releases/download/32.0.4/OBS-Studio-32.0.4-Windows-x64-Installer.exe'
  silentArgs     = '/S'
  softwareName   = 'OBS Studio*'
  checksum64     = '46A18BCE8E2FF662B700C91D340A519376E712FE0AF0D335536E4F9FD253F10A'
  checksumType   = 'sha256'
  validExitCodes = @(0) 
}

Install-ChocolateyPackage @packageArgs
