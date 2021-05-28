$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/ab3145f9-eb8d-4fc9-94fc-4a240d1aaf80/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '45E0C200E2F95AE77D5BDBDBCA2DE106DBFB210246741DE0BF3F3369CC620540'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
