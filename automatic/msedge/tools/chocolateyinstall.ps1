$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/b8fec3d7-71ad-4f2f-9cb7-069fbe37adbb/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '0459E4F94FDE0D210C5CB3A803B9C6B1CB6ABE69FD9AAB8FD542008337ED2643'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
