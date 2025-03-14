$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/1900a1e0-237f-4c1a-b275-aca40762737c/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '4B72FBC8467BE26D91BD52D4612568AA8B405C2EB4424A2315431718D7E65C5D'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
