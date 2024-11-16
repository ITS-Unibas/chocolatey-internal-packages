$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/13403e13-08e1-4a5c-babe-d5f1d9eafe41/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '630F3B89F6643BED4CD97CAAD67432E6237C8BECB8E03B716A0E4D0DC67BDB1E'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
