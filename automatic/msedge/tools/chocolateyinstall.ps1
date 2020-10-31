$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/4b7f760d-1fab-4168-ad81-b3de03b69a31/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'AC39FE3CA9FA148B9A7A85370CAD15AD6B0898635DAEAA245089A974ECB52847'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
