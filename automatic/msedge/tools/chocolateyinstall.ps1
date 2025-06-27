$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/f61fac02-be61-44f1-a05f-daec1f0e8296/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '251F355AC4D3B72E0764C55285F05AB020773279717AC7E5506077E4A7363333'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
