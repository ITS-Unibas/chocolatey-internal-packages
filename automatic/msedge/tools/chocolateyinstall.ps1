$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/6a84e2bc-2a58-4fe3-9aae-a2de8317bbe6/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '005F1A9B192B1044D7198FE22F3B0C26781264FA1038CBC4A3D524E1AD08B1D6'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
