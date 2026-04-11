$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/5428dd4e-4363-469a-a2f5-e7d44afa501f/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'B0C8FE30357B666BEFF27433B81D001DF50AF53B16A598E2C0E65DD66D1C1B35'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
