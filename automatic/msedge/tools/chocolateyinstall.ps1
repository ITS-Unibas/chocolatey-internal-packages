$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/474ef7db-5e18-45fe-89ad-2f60ba83048b/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '342EE06BE5E36AC5B7E8DC4C411BF9600E9F912FB6F44885A35E1D4354FE8536'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
