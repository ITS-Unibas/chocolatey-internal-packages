$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/f5524660-74d7-4441-9aba-4c5884a171a5/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '4343BE214825A50C72FCC0C30655B2A040DF6F53A7410AAE063D90D7E52BF666'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
