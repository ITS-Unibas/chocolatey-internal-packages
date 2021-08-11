$ErrorActionPreference = 'Stop';

$packageName = 'unibas-integrative-genomics-viewer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://data.broadinstitute.org/igv/projects/downloads/2.10/IGV_Win_2.10.2-installer.exe'
  silentArgs     = "/S"
  softwareName   = 'Integrative Genomics Viewer*'
  checksum       = 'f7a52b8e8aec1f6a874d6d8974af5ceb36f9e5628e99a32e8fdacfd2f0e43662'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
