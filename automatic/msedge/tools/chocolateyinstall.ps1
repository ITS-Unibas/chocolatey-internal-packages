$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/fe9574d3-53dd-49dc-9fd2-e598b812c0e1/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'E29E1D0F69CD374FACF46C9AF5CD0DAF11A57953C640F452A8FEB967AF23467C'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
