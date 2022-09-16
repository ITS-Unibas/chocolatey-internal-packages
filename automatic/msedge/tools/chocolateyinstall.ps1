$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/810f5f99-1567-46ad-9a44-4b26ba115366/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '9C27BCD80EA170A6E4CB44C8443F239896949E3065DDB46C5383D1B905898E52'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
