$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/f6b85cef-c6fe-469d-aa76-a72fd840d6cb/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'C0352601F2A91730C4D29B22F3DC0C97D73E45555531623BA16575B7BC76EB55'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
