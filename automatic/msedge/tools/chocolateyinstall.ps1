$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/2f56f555-a769-4a4a-bd1d-8b7affd26e0d/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'AD3E91DDC32E3E650C3C06B459EA2C20BC8EE352F92C6A53C2A27129427B1DEA'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
