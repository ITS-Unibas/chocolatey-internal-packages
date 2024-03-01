$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/364b6593-2f7a-451a-aa42-917a09776831/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '5D44540FC6A69344DE41A4DE1A066E33BB4F743E09ADA811329AB8CA4167CEFC'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
