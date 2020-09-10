$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'http://dl.delivery.mp.microsoft.com/filestreamingservice/files/63c21fa1-e10e-40ef-a9ac-b51f877c7cfb/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '14D600A05EDBD86C5F291AE9597CBB41E1F88F505F24DD3F899A61146F320717'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
