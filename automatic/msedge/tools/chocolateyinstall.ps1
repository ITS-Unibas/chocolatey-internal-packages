$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/819f400e-692f-401e-85d1-c738e7a4eefb/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'C78A2EBC3BFE803145F6E7336A101818AADAABD345FC432958438706FE169EC4'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
