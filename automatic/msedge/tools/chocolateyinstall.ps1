$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/dba89b53-9614-4a7c-b1f3-85e5dd724930/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'A322164810FB710928E3462FE4401511C8F14B0B2F09C7678F6A28E7A12F1084'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
