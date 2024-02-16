$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/3a274bcd-d249-4afb-9c76-b19dc2016be2/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '326E4025DAE2A838051C88C0E90B9A99791DDEF634D54B0AE524AD4800F85852'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
