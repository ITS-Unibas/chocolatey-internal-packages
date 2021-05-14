$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/2fa04572-8170-4fcd-85a7-3530762cc91a/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '23741E95530E503900C97CF9788FCD2D435C4C03449723DEE523BED5798D935F'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
