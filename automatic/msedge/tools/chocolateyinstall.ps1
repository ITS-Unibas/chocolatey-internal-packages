$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/2d358381-061b-490a-93a6-72ef3392b340/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'E56598E1AFD29FD0E4321E61DEE3612B11551626669F9E83BA71D438470CD6B3'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
