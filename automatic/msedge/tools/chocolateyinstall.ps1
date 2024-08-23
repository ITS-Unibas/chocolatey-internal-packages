$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/a1026d17-ad76-425d-a522-10f538814ede/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '1986A1828B5213104D10B28F5F6C562827BD73C6C326EE49EDFC9011534E1FB5'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
