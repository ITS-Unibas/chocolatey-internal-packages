$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/d1ec9411-fa61-4946-a93d-b0db1ae42cf4/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '9FB32426503C31B5D59BF3365CAE8003B46487E9B411FAB8DB5C115270A9A4FD'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
