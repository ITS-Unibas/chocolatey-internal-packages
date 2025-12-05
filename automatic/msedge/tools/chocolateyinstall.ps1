$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/1746536d-09e3-4e87-9a55-cfcecb49b3c1/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '7C8152DC97C41D2824D3F49778A7D701B6FD9E49227F1E6B2E807F9DB35246E4'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
