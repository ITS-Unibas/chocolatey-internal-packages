$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/68c5e2fb-3fa9-493b-a593-69ab63bd2651/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'C85425E6685D4C1B61E5F8348483F73B1653CD52901B7A5592F4E64ADFDBA652'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
