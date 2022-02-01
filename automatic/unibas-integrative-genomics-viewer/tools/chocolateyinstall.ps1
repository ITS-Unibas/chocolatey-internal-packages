$ErrorActionPreference = 'Stop';

$packageName = 'unibas-integrative-genomics-viewer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://data.broadinstitute.org/igv/projects/downloads/2.12/IGV_Win_2.12.0-installer.exe'
  silentArgs     = "/S"
  softwareName   = 'Integrative Genomics Viewer*'
  checksum       = '729836adf7e7200470ff5f8e31b4e1f46f34379bf4ca6ae6249183dc0a1b800a'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
