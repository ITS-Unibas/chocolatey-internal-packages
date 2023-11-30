$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/1a0dd55d-618e-471b-92fb-5fe178a0e52d/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '0CEF93CBA01879BC74C457D2E1CCEFAA02CA674345B5CD9FE22B4DBB70FC6A00'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
