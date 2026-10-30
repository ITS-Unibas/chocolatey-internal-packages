$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/584a7fa5-95e4-442e-ae43-13c995ebcb49/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'B6C7186C05BC8531CD9CD2D012A597EF17FDD3E2515DE7EBB223AB79E9014C8E'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
