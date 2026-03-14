$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/bf4c8a23-02d1-4959-ba74-5b78dfb3319b/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '88930D28101CA4C066F8C7C89D90FEA277E06333BC5D61760A232AF73EE920C7'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
