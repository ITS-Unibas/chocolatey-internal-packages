$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/460a8815-de07-4b4d-8b65-29051aefd4d6/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '14EA8C2CB4FAAF31B10E006726956C96AAB90718E9B02312A3203422EFA12F80'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
