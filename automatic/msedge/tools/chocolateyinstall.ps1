$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/0b43c304-c065-4a11-b6da-66f30c2c46e2/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '4AFD1986464B8BA8F2CE84CE2C988C3418E8C3DA7AB2B2BB225C5EBFFB539B17'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
