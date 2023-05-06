$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/88a132db-0c2e-400a-959a-9bfb48451f55/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '19AB8FB4FA70BE24FA9E6329E1A646CE875BFA212EBDB81B585291129D9C9208'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
