$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'http://dl.delivery.mp.microsoft.com/filestreamingservice/files/0a077f07-cf28-43b7-8b27-83239251807b/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'B570B091513D5AEEF7897B516B5C9A99448B7679137467EBEAA21E4EDA60206E'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
