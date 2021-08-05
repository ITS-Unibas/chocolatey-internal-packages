$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/04250e23-18c0-4a30-b568-62c82366e8fe/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '446DCC1A325FA8193B15755CBFF23EE9345333A49D5B3CC4F86A12DC891DFAB0'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
