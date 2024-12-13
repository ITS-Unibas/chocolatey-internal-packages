$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/249fe233-1b7c-4b8d-93bc-e64ba81a0c02/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '6DADFFB1BCE1E05411BF1565569160997D6A459C1045AE206BBE11C15BB89D06'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
