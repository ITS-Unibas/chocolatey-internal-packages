$ErrorActionPreference = 'Stop';

$packageName = 'unibas-integrative-genomics-viewer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://data.broadinstitute.org/igv/projects/downloads/2.11/IGV_Win_2.11.9-installer.exe'
  silentArgs     = "/S"
  softwareName   = 'Integrative Genomics Viewer*'
  checksum       = 'dd4805750e104c3f7a5840d46abb1e4e9bbe295967937c0e56c9877eb673111f'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
