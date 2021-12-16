$ErrorActionPreference = 'Stop';

$packageName = 'unibas-integrative-genomics-viewer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://data.broadinstitute.org/igv/projects/downloads/2.11/IGV_Win_2.11.7-installer.exe'
  silentArgs     = "/S"
  softwareName   = 'Integrative Genomics Viewer*'
  checksum       = '106f030027e3b4657fc9fb255efae188c4ba9f6b1aa080c0e69cd249f65ad888'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
