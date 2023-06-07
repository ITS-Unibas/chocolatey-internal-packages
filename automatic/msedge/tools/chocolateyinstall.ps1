$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/e719c7cd-737b-4fb5-9c10-d03ddcd4856c/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '49313C849762162AE4C514F45474FC001FFB81125D414838255CF8806FFB349B'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
