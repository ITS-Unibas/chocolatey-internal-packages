$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/ac36d1c3-e536-4adb-9505-965a6cb45405/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'A40EC96A15DCDB309F8CF83E578FB44C8245FABC1F6A0BABAC0835DBB9351F45'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
