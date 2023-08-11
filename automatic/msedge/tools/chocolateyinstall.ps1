$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/e1ce42f8-6dd5-48ca-a8e4-7f8efd660e57/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'CB4D70F50199937139C827901C6B23043304952195672A44BFA4A6A6F547EA2F'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
