$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/6da9fcbb-b818-4fa2-a41b-7a040dd8c596/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '47D2363D630C748FBA8A72107A570D8D8FAADF686412E7A4DF3824E4ED1CEE1F'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
