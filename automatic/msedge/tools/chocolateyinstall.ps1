$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/ded68157-46e9-4336-a3b0-67ad31f3ea2c/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '548E0700390FFD93545F40A8BAE1489FAEE3536F84CD7935BAB5A087F3758F36'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
