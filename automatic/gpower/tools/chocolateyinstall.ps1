$ErrorActionPreference = 'Stop';

$packageName = 'gpower'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = 'https://www.psychologie.hhu.de//fileadmin/redaktion/Fakultaeten/Mathematisch-Naturwissenschaftliche_Fakultaet/Psychologie/AAP/gpower/GPowerWin_3.1.9.7.zip'
  silentArgs    = '/S'
  softwareName  = 'gpower*'
  checksum      = '653615497c763863bb10a06d605ba0073cf5f9f035bc6246e0dd21405a39bc6d'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
