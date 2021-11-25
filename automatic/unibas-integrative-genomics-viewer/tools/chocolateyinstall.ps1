$ErrorActionPreference = 'Stop';

$packageName = 'unibas-integrative-genomics-viewer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://data.broadinstitute.org/igv/projects/downloads/2.11/IGV_Win_2.11.4-installer.exe'
  silentArgs     = "/S"
  softwareName   = 'Integrative Genomics Viewer*'
  checksum       = '62539a5a36104ab3afae6d571e751fa38fb0924321ad157f8ccf6503900da655'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
