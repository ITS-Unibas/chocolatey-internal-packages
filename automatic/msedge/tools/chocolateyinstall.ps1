$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/4a49d06a-0c3c-4c92-b6da-27eabc0cbb0a/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '33D86DCFBB76D7458C28BEE411B2B4F91F3810FA87249D7D10180597F9B3AA04'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
