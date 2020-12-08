$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/03451de1-d169-4066-a8db-6219f639a060/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '7A96EB23D53982EC0EFFAF21862137ED90A4EA84DFF7C4B20818CE5534543DC7'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
