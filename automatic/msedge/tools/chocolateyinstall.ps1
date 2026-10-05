$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/ca55427b-c2e4-4fa7-ac5a-bd9152f02d9e/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '6D493F4F5C3076EB80C173323A97546C7ECB9B9B3206150F255815549F35A497'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
