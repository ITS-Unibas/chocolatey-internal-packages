$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/04953c72-9e0d-420a-950c-15e0e659a225/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'A94B57474027D0AC09EFF06A8A39DA39E22B2E3D220C4E5D6A1743AE7FBC4654'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
