$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/3621e33c-826a-4d7c-b6a7-4e14ed9e5fa1/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '292ADF1841C7690FE2B572290C800DACC2C52E14C942ACFAD2AC913A152F5BC7'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
