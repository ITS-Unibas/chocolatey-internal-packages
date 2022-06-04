$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/1b8b7cf4-7a41-4a8c-bf2f-ae72af28ae99/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '7CF1B468A3D20057FC5DA29EC3F517348F92BC564E37066450E462FAAF57DF9C'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
