$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/4fcf0712-41db-4227-8ab7-9ad98e0c8c71/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'AED1EA7A781672596FBC85FB3709ED15DA3F8AB367FED264137B7FDECDD2E8AB'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
