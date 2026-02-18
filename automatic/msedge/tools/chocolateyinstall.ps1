$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/20afa02d-8004-431c-8489-cce6c4985212/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'F69AC2A2B45CD4F76933F93F6CBD08998872C657F88B2AA3AFC27B0FFE46DD74'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
