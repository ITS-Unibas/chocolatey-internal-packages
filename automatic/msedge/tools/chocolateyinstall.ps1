$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/d345dd51-b736-46fb-9695-3d41cf62f802/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '4EE06053CC02C8C76CD70D9D1556FA23A39164FF77FC6252B96FE0014FE28FEE'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
