$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/fda30341-4f0f-4db6-81c0-884956f58699/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '4093D052BA3A2AA36DF68B6DDCCB6C703993F5CBA0C5AE6E4742A2C501D6CA43'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
