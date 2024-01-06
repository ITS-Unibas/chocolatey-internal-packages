$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/fd754f57-46d1-4a7f-974c-1b57a92439cb/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '343AD79FFD86C7FC5185AD4D2C3819ABA82AFEE7C70A70085F0743D777AE33A4'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
