$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/59faf0e8-a816-4a82-ba48-790322d0fcd7/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'FD1458CE62EA7A3E057F51DDCB2D409AD85A3BB8EED14372474FF3ABE5830324'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
