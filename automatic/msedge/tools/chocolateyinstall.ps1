$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/f514a0c9-7e26-40a7-8bdf-3a50bd5982ec/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '6166443C3C230E96C81C6D33759B6530E6B5F4780782BE35C161EEA19428C3C5'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
