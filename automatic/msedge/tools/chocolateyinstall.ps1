$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/3c6ae291-90fb-40c1-a734-fc44be9bba1d/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '14F6989FFCA5513097936DF97F5F7A683B4FA7217D6F44390D906F540832A80D'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
