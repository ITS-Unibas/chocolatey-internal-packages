$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/48bd506a-8959-4d3c-aeff-5c9fc1587a18/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '4A3C1E3477D58495B4049F373FA9606AA61F30D5B78362955DE49638090C5F80'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
