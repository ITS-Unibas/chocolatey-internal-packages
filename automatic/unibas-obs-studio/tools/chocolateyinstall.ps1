$ErrorActionPreference = 'Stop';

$packageName = 'unibas-obs-studio'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit          = 'https://github.com/obsproject/obs-studio/releases/download/32.1.2/OBS-Studio-32.1.2-Windows-x64-Installer.exe'
  silentArgs     = '/S'
  softwareName   = 'OBS Studio*'
  checksum64     = '94D180C1FC481CCC307B95513F795D088D63AC4F61AD3253C2AC0D94D0844110'
  checksumType   = 'sha256'
  validExitCodes = @(0) 
}

Install-ChocolateyPackage @packageArgs
