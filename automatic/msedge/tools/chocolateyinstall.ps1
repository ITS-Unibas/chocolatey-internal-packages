$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/1023dc2c-05dd-4cf9-8ca0-b4b7f032be10/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '65EC853A6CFE77025AA0DCDFEC04544E08CA5F46478243097C2715E3CB66DE6D'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
