$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/a4db920c-174d-4cb2-8190-c1abd54c49ee/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'F78FEB2FB3A1D7F7249A467558D7EA29C98EB70D6D8CE4DA061C459C147F6BFE'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
