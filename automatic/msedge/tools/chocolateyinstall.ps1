$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/2a73712e-5743-4ea5-a5f1-c537d22a1c18/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '2F19754A07DDD17B5D372C5C72703E14D76C9E0C83C51A61E817FDCB7443DFBF'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
