$ErrorActionPreference = 'Stop';

$packageName = 'unibas-integrative-genomics-viewer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://data.broadinstitute.org/igv/projects/downloads/2.11/IGV_Win_2.11.6-installer.exe'
  silentArgs     = "/S"
  softwareName   = 'Integrative Genomics Viewer*'
  checksum       = 'da2a805449adbc75dcb16873365e64f7c817968642a03b09aa6f5179ddc56e0b'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
