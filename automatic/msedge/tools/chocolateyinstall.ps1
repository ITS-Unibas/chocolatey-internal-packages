$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/da6559fb-cc77-4065-bcfd-c80e0053967a/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'A205AEF22655FF2F0E31C05985F51924EDD70E07314DC90246E10BC653244D56'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
