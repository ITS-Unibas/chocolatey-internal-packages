$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/d91317ab-96f4-46b7-a048-4762507d8713/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'DEFDA31CF926B666CCB7A9AC97B714688DC59C781FEC14602262A46E67F47F0D'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
