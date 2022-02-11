$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/6f9560fe-6261-4d62-92ad-8468042e5438/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '292FC0597829C22AA3881775A6381582E756C431AD389E3C79376E0F713DBE60'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
