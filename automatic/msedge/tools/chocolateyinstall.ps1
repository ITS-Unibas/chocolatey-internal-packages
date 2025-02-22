$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/14d487e0-f3b0-4400-927b-ea6098ecc9b2/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'DEFE16D18EBCEE5E4D8A191253671D70C347033E94AD5822734C339203F3B2FB'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
