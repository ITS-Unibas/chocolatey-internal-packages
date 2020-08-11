$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'http://dl.delivery.mp.microsoft.com/filestreamingservice/files/e1aecb62-8ccc-476f-8f17-261ad2e9601c/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'C1FF817B59AD7C29CE1682500298CCFF7CF72F175625FB429A065AFEE976FF76'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
