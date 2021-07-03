$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/dc298968-ce66-4bf0-ac5b-c274bf03ee7e/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '3EE75CEE66DFFFC5FA679B16ED4FF0B753753C78B018FF9D7902E5A82E1D2A86'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
