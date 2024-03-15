$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/9429ba19-e50d-4bf5-a7f4-3a2df399b7bb/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'BCE51486D390B17326B93B1EF32B4F966B12B857828065DF4987A3FB362A7978'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
