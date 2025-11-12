$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/4491b061-346d-4e2e-b02a-6baf19e90926/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'B3C83444942A894970CCCFA7208DA163A8D0B1720804DA72F97A4E095EA9B0E1'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
