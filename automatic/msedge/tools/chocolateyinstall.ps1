$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/b3b57e5f-4415-4d9c-a1f6-3707529eb431/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '14F8688E737B2D566FAD5773F715CC4530B64BDE928A6C793555C72BE906CC43'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
