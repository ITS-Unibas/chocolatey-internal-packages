$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/8a5ae4c6-1967-4a5e-923a-d7d6dd438b2a/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'F4DAEE95993E71D517842DDEED60061710ACCC8D9E39232C6F4B51A0551E56FF'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
