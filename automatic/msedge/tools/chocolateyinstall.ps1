$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/4f01769a-4103-4746-9702-3c310a7d348b/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '0A7088050FD5EB487D88308C690511F1FB6F832DE7F54B8721B2CE262B34C93A'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
