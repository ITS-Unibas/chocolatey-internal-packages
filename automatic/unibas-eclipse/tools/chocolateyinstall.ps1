$ErrorActionPreference = 'Stop';

$packageName = 'unibas-eclipse'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64       = 'https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2026-03/R/eclipse-jee-2026-03-R-win32-x86_64.zip&r=1'
  softwareName   = 'Eclipse*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum64     = 'da9c804c43606a80a1d926656e30b1cb4ec52a3a9ac65faeb8a1e2ca04d69d0b'
  checksumType64 = 'sha256' #default is checksumType
}

Install-ChocolateyZipPackage @packageArgs
