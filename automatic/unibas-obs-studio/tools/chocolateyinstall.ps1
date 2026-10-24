$ErrorActionPreference = 'Stop';

$packageName = 'unibas-obs-studio'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit          = 'https://github.com/obsproject/obs-studio/releases/download/33.0.0/OBS-Studio-33.0.0-Windows-x64-Installer.exe'
  silentArgs     = '/S'
  softwareName   = 'OBS Studio*'
  checksum64     = '3BF55DAE6D9DB651505828090DE74540296C742ED2A94A28CF055CB6DDC6BED3'
  checksumType   = 'sha256'
  validExitCodes = @(0) 
}

Install-ChocolateyPackage @packageArgs
