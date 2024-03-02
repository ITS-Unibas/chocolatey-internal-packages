$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/2acf7a8c-34d3-433b-a6e8-527c0f9f88f2/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '3BA8E140DF3826FA70FBC9B2192E85294B77E450BC9BC403FB2D14C184F1DD55'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
