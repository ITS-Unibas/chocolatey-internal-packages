$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/53d457a0-d60c-48b7-bf76-cb781dd16beb/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'A10E95215D860F76932D815EB2B2D12084A420BF9270AFD32FB4500429CBEA7A'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
