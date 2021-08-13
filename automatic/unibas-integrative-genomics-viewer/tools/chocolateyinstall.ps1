$ErrorActionPreference = 'Stop';

$packageName = 'unibas-integrative-genomics-viewer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://data.broadinstitute.org/igv/projects/downloads/2.10/IGV_Win_2.10.3-installer.exe'
  silentArgs     = "/S"
  softwareName   = 'Integrative Genomics Viewer*'
  checksum       = '3376229958f163fd0a67179fd63aa25ecf91a5bc8a6bdabcc78128e7a4cd192f'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
