$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/b3ed8b52-ee6b-401e-aa19-85b6f3dbfa0e/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'C21F6128E1D30C5386E5601E560DE36394A7156D5C8DAB8DD96995BD69E3B1EB'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
