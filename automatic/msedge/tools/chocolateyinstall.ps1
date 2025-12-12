$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/f4a1088c-eb1b-450c-8902-d4198f2d643d/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '74E22DD801884639DF51BB9DB0EBD5C9EF664500C05554BD1823DC0291A9F218'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
