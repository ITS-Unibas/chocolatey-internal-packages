$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/4435014d-a92c-4272-8c83-fdce78f60ced/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'A4EEF0F51835B75F3232F03E79FE26F6A7998464A98052F1428D2B0FB5B88AB0'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
