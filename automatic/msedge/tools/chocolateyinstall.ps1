$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/d5ec0499-4f87-4037-bab0-505fca7d2ea0/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'E7BE183226A00175F4E6B6386C0C8F9843B291516CCC9925F6876C71C5EAC58F'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
