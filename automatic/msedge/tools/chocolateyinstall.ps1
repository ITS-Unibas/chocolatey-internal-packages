$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/83788acd-5a05-4a45-975b-b1338831a73c/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '123538efe88960620a539558bf304b0b4169310484862a0e50b45aaac22ea1df'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
