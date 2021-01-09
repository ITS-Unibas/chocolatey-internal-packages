$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/6c81271b-682e-4299-a0e0-e00f65e76619/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '6A4881CC9FF0E316FAE2CBE4B4C3446A8A3955A3072BB0B5B21C58BE71D4AD22'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
