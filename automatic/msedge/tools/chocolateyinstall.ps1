$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/311f0c4f-89f0-415f-a56a-74060ca99bd0/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '36B370DD79EE5C20E40980EC3CFE44B01EDD94B81E908B7D0411548A6FB27FD5'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
