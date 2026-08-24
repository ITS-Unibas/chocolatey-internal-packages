$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/998bcf3d-e044-426d-9e9b-61da81399306/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'B75F03B87DFB0CBC85BA2C0858C632511B17355F42563A43FCA5368100FFE0FE'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
