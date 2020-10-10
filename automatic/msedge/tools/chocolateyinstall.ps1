$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/53a5f508-44da-4f9d-85d9-312fb8f92f4b/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'D49104F182675701423CB774CD2120B3A3FF63565661E4364D1169F64B9019EC'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
