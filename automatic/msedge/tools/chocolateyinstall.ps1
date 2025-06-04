$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/b3e8ca22-0dbc-41ce-af3e-50320b10352f/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '29BB41FF7B9D40F691D544D5F9A2213AA25788C14A6A462BDB44B0555AC36F3D'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
