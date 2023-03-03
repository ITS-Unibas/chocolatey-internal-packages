$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/ce61e933-0a8b-4706-9eb2-a6eee26de148/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '279A2D5421BC36AA8DD2117069D4D2BEC05CD452CDD58002FEE6118C09320E52'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
