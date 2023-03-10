$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/ec39329e-4889-4526-bee3-76706652f0b8/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'DCB6413B96338E9DEE5AE28385A11BD968076550C42F05E2C5264E4D7F86F695'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
