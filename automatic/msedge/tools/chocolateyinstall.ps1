$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/d720cc4f-1c3c-4a9e-ade3-0e7671f7c794/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'A362893DD753E81CBF074B9F33CB964E6B9F7AD9D006EB765B1E87F6D702A6BF'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
