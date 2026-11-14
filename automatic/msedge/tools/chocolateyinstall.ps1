$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/277044fc-f1ea-4102-a313-b58e7fc47c6c/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'B86B238035C47673E1C70589A28F2E0961E8CABDD3FF25EDBB1E52239D7ECD76'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
