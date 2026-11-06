$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/a6fb1f54-34b5-43f2-878f-b6c3f3550143/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '14D79DF658D7AD4B8E8D2F8D2456D10B98A860890DA2352A394E346CBDB32FE7'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
