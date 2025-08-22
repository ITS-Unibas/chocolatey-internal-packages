$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/7391befd-12cb-46ab-8797-7c9d6a98d20d/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '182C90DDAB531717750BDE7FABC80CC3DD21CE0277E273CBAD38B13C0DC03917'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
