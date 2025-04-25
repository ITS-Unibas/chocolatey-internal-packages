$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/96cf258b-7c25-46ae-b1fb-3516c892f718/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '14115FC1365374251AFA675AA0F091D7412F6EF9B69A01B37C38AD3D85BAFA22'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
