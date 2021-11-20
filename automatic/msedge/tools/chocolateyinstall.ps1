$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/573e5b4d-c153-45f9-9057-4953500f88dc/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'E3B612093A5802D695130A9638B778871E945FD0F57BE521ED9840B2F22106E9'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
