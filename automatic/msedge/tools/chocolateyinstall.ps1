$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/017f6599-46bb-4178-98cf-8d841a0fb014/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '246D6FFDD873AFF96392FEA520EB0F9AE47FF5C7875B63FE0E87627230517C8B'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
