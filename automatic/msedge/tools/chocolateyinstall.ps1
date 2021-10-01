$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/4ea9485d-d953-4f20-91d9-99936298f1ef/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '3B461CF1A889025C99051F3CC41E6C639E4D66C67F2D3739FFD859C11F16DC4C'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
