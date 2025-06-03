$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/54824775-785a-497b-ad6c-ec11548520f2/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '4ED9609566E8E9E981B47DAB530BB16FE0F94D57500E79BF97A4D5D37602648E'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
