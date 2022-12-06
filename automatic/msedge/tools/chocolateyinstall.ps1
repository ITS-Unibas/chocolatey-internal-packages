$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/5d23eaa9-0799-489e-add8-c268c315fe7d/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '3E67D58B3E1E1CED6921613F50E05100A32F39256A409693FBCBB6B0199E2E5D'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
