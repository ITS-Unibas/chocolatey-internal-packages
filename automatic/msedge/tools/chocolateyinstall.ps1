$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/30643f1c-1abb-4260-9d92-db6894e7fedf/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '534E09D72E51388CDE4D3EA633CFBB897776430FADEC018F354DDF4AF7307884'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
