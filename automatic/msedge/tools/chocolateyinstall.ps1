$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/fc7d62cf-e4c0-4214-abb6-450d9210daf2/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '766DBE048BAFE59ED79A4EAA6796402F3195DB2DC40EBD7768CD2A2B706F34DC'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
