$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/9d4c7c2e-cb4b-4c4f-9a33-de500d1f592c/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'BF65E0252FA710B1D842333563134583F94475D27586EBE5AC058E47B09426AE'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
