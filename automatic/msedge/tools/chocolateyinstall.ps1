$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/00043fbb-bd3c-4c99-bb0a-cedcc9e89433/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '467C18B8E078E5D7CD0FAAE6D9E48CF1FA4949E66488426F67B34C125FD6F130'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
