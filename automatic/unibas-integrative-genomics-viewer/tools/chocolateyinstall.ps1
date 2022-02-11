$ErrorActionPreference = 'Stop';

$packageName = 'unibas-integrative-genomics-viewer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://data.broadinstitute.org/igv/projects/downloads/2.12/IGV_Win_2.12.1-installer.exe'
  silentArgs     = "/S"
  softwareName   = 'Integrative Genomics Viewer*'
  checksum       = '27491550c54741df8cbcc4b48c13b5d30ff6f86c7fb8f539fcd8469f4b0d5d21'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
