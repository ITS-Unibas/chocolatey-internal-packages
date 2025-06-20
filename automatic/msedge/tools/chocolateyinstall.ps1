$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/92064bd0-b0a3-425c-9247-f50298c8791f/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '0D4A08FA0659085A51B8C3208264359F5B6271B0AAF43DC6A7541711943A7403'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
