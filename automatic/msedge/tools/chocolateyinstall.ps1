$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/0870b5f5-cf08-4f24-8383-f362a669fcd8/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '037340DC31DC0D2DD6C0D7E7627064B3F34B03656D37A7CAB499F4E8A1697882'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
