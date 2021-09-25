$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/a60614d8-2f4d-4e21-a501-f0d77537446e/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'C004D83495D6B4C0BBD9567F8DD44F11CA8E92DB1CE10984EC6C755787AF9B84'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
