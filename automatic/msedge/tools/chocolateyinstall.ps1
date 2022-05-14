$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/555154c3-778c-459a-b79b-24f5d3e2134f/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '1CD499D7758E20E548C0A028AC7E8CADF5E35C851C9E960FFFAE8D7416D4DD1D'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
