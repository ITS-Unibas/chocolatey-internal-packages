$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/cd93c2d5-c7a0-46a8-99bf-90e2b7763534/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '362D72114B1299C8DC377F1EEFFD583A7DAB1F5BCB7DDA6FB42A3D2DD64399BA'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
