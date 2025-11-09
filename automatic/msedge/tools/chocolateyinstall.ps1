$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/eea97c16-45de-4230-8da9-47378522e52d/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'BB381004E2180F3094A2CFC918D3FB1B09B1CC18A30B7C9D6E5F0FF05D76FBDB'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
