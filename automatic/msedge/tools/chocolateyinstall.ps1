$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/688f2efa-1443-4889-bc4f-646441c5e716/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '5C967DBD76FD6BBA5626555605D4C578004A048BDB0ACD834E6A4A4FCF45BE13'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
