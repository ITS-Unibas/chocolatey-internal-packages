$ErrorActionPreference = 'Stop';

$packageName = 'unibas-eclipse'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64       = 'https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2025-12/R/eclipse-jee-2025-12-R-win32-x86_64.zip&r=1'
  softwareName   = 'Eclipse*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum64     = '01ca2e43f14231e94647515024ce967121fdb637f758d87899032d0baefacb45'
  checksumType64 = 'sha256' #default is checksumType
}

Install-ChocolateyZipPackage @packageArgs
