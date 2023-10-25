$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/20716944-5932-4e91-8fb3-d43dd30bc306/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '1083B6E69B3E611DBF2CACB5FEB8C9DF82172C2BFD39624DB77D1F12918C596B'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
