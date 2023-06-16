$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/0912b163-fa04-44ee-9b3f-71cc83ffef25/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'C7A770E4935A0BB5EA2A1AD223F4C8012F114E61AB45B699137A12FFB2C75E5C'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
