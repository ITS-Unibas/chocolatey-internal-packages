$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/7a4d6bab-6ed2-49ee-bbb0-7b581034c84a/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '5FFE5618092DA7E8603BDAAEB0253D31CEAD20915B6BA330E4177DFF18401F52'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
