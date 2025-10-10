$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/2bfa5f57-5475-44b0-956b-2955afff880c/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '1684DD63967283760A20763881B28D801617502D2ABD8E63A9885627684917AB'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
