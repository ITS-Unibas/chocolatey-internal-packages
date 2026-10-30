$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/d0a4e3fc-604a-4d46-8fd6-e90de2df72f6/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '784051EBFCC8B28569127F381D515766866C4925312D35C52293382B97EEF2FB'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
