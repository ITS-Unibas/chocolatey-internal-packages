$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/deca85f5-369c-4c01-933d-f1b544563b31/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '6675000F8D493DF6211AA670F977CE17E8F2BB35132718DC3E873B0A49E000F9'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
