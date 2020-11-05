$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/d6db3929-bc06-4daa-a9bd-c9dd25f15dd9/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '21D89EF6CF0A6DB8F2FFD6693A10FF7E3F4A571C402F943164A9E173A0FE52BD'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
