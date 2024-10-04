$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/b3f710b9-ad04-461f-8b3d-2c0b1a316be0/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'FFC26534C587A0F742259ECC40ECD9D2F159A2AC0722D84AB3FD03FAD83C8D57'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
