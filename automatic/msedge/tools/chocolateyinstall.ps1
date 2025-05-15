$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/79c5e893-f4f8-4c4b-87fe-85e97d023d1f/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '3FCBE14FE37A7C3C9D41958782FB87945D5CE04A4E5A0FFB0BB17217560C866E'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
