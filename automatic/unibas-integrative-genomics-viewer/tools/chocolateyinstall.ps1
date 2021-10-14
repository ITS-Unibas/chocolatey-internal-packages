$ErrorActionPreference = 'Stop';

$packageName = 'unibas-integrative-genomics-viewer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://data.broadinstitute.org/igv/projects/downloads/2.11/IGV_Win_2.11.2-installer.exe'
  silentArgs     = "/S"
  softwareName   = 'Integrative Genomics Viewer*'
  checksum       = '8062fe97bf1ed88427e31f55999096aeeba0491968e1b7aef6258afaf230dd5c'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
