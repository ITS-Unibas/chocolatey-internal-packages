$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/a37eade6-cd7b-42ab-94d0-307b9e6ec4c0/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '820C014C971DA4B19BE14C40A2753DD35712573AE6E1AB4F555D36A21AC5BD57'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
