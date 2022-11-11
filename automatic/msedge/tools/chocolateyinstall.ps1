$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/fd5ef4ba-d75d-4724-8598-48655a5e5283/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '7EDCB49D250F4330253036CAB5ADF3488F5F42FA1FFBF5B9A8E6A4E6F5C7D322'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
