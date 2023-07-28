$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/41fea851-ee50-44bd-9f20-305df0f9f4e5/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '9E2760244FB9447E9A27F168F1A20B65CA9327A93541D55480F5B272F05741D5'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
