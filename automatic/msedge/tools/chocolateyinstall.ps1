$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/2ae295aa-6f3e-46de-b26b-c0188683d4fa/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'EDF3E24EB291B26BBD09C0A7477E30CE32897E4692743B47961CC40C0CFA8685'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
