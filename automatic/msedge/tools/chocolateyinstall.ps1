$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/7110b41a-d8a5-4d46-8a7b-61cd2829f1d3/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '1EFF2543FF905276BF16B3C2B508FFA97ED52E7B96F122C310C1FF5D42238EC1'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
