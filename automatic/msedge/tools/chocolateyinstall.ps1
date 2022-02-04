$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/7f1e99eb-894f-46e9-82d9-8fa888df0a57/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '88976A0D92DFA1B8E6C352E64F196255ADC71E76F62F60A31172CEDCDBC3B5B6'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
