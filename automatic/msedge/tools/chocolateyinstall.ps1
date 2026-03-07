$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/cabe9a30-78f3-4857-96ca-067e3d62274e/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '8D91C95BAC815182A4A1A6946C70FEA7D8E5FA5CA771DDE5103EF43B1CFEB5F5'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
