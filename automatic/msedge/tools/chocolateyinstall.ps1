$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/970bb6fd-67b2-4c87-bbf7-0dec1198e8fa/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '09679E1CC4AE909BAD7F3347697A450DEA33B21BAACDE2ED677F05D381772654'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
