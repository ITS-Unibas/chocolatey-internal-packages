$ErrorActionPreference = 'Stop';

$packageName = 'unibas-obs-studio'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit          = 'https://github.com/obsproject/obs-studio/releases/download/33.0.1/OBS-Studio-33.0.1-Windows-x64-Installer.exe'
  silentArgs     = '/S'
  softwareName   = 'OBS Studio*'
  checksum64     = '37ECDE4D9A28E8AEEB07623C8469B5D558EB264E02CCF435BB859891C401758B'
  checksumType   = 'sha256'
  validExitCodes = @(0) 
}

Install-ChocolateyPackage @packageArgs
