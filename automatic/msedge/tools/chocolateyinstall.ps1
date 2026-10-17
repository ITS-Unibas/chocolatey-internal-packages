$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/bf3e7059-ee35-457f-946e-42963960692d/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '20119979EB1670F670D38C093FD1C61F5A91D880C473F8614825CE9AEF35F68A'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
