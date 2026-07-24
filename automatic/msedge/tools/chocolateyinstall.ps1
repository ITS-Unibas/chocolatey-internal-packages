$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/95aa11b7-11ea-4914-9c52-c116af1547fa/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'C50452BAF080C01BE2E3D5516B2618255515BD467AC346E5E95B142FE308A7C3'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
