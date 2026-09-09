$ErrorActionPreference = 'Stop';

$packageName = 'unibas-eclipse'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64       = 'https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2026-06/R/eclipse-jee-2026-06-R-win32-x86_64.zip&r=1'
  softwareName   = 'Eclipse*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum64     = '39ff37eec0cd0caadc0d7660ebec5c46d15ef40105fa5730298ac5203def32d4'
  checksumType64 = 'sha256' #default is checksumType
}

Install-ChocolateyZipPackage @packageArgs
