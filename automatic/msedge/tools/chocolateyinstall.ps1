$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/c3188b85-9e73-4ed3-a846-1c1e689e7b85/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'BBCDB342ECACBF1EDB5D326061CBBBCBFF5558FF48AD4489A442327EE5B0E89D'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
