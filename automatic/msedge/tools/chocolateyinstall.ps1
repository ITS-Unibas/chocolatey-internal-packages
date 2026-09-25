$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/78f7562d-5160-419f-b64b-b9dc3da74bd7/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '4D8D922C8B2470084A380142CDFD51B2B28A83AF7982D8F023CB8FACBF258246'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
