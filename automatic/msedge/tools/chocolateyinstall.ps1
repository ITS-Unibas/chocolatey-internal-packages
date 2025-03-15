$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/fb812362-632c-45ee-80e7-f0abc12d9d03/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'C04D0714EC85A5502B121EF96E8CFD290A587CB4D850FCB88905503AF98F3D3E'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
