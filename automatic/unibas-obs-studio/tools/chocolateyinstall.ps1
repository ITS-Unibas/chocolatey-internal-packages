$ErrorActionPreference = 'Stop';

$packageName = 'unibas-obs-studio'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit          = 'https://github.com/obsproject/obs-studio/releases/download/32.2.0/OBS-Studio-32.2.0-Windows-x64-Installer.exe'
  silentArgs     = '/S'
  softwareName   = 'OBS Studio*'
  checksum64     = 'E85F7CC39129C4C1999D84765FDE8DADE4C9A9800972F78D752AD218E7C50302'
  checksumType   = 'sha256'
  validExitCodes = @(0) 
}

Install-ChocolateyPackage @packageArgs
