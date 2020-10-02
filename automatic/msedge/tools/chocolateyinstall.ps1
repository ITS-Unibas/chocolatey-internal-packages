$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'http://dl.delivery.mp.microsoft.com/filestreamingservice/files/8fefa6a6-bf4b-45b1-8051-791dbf60ecd1/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '6890A0E1BE3AD8CCA494609E8DD92F4DEB2C3761551215AC2BDE2D41B744E433'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
