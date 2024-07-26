$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/f99bf7d5-77f2-4659-81e7-4e9bed513374/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'D8E97029246E5E2ED79A263CFE834D1A06B725552232A158241D6500151D1B61'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
