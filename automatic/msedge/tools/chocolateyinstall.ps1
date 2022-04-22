$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/502292d2-eb78-4ef3-84bd-56394537153c/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '8DBB909B8DE0405C3833D5B9223B97B1CD4A99293F6C4CFF9546C25AAF8F1B83'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
