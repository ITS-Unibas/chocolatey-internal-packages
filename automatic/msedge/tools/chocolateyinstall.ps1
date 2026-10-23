$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/62209208-6eb6-4f5e-bff5-feb45cfe41d3/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '324D226C5ADE08C2776645CFC2A7B12AF9C08214ABF18C6499410CD8ED92D1B3'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
