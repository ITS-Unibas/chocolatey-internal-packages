$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/a8ce96c8-241f-4493-ae92-5c85e40916f5/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '9A49BB5B0F38A235712647024521731EFE275E07A5B607BBC774A0618172E346'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
