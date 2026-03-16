$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/e7ea1256-d70a-4019-872f-c65dea9da3a2/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '4B04B87ECE29A9476D92C12B110E16BCE5BA07C78D160B871C77568EC2E4BD4E'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
