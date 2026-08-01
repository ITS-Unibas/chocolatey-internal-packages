$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/6d262b14-57af-4d34-aa54-b13dd27d2547/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'AD2FB7B3BD49564D0967C4EB0B0307D5420A9636E8E2F479E7FFC4E8B7B86AE6'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
