$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/ac2ca0ae-cd4f-4b4b-b59d-ea292fb7e565/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '8E9E0B58C95CAF4B6743E91EFE380C79262003DC808D4B157BB494B20EE3DBB3'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
