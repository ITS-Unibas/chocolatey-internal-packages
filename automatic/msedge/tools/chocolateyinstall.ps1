$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/c34d1782-6670-4a49-8a30-133ccce5f422/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '744CE7EDD78E099D3532E72CF4E3E1238D7DA0507EBA4604CFC09F3F69B1A799'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
