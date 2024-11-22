$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/7ab0304e-1ecb-499d-b7bb-6e4a4058ad23/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '643D024CC13E23B94F83DCC8A2BF1CFB1579C83B1621941E98825E99E71B411A'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
