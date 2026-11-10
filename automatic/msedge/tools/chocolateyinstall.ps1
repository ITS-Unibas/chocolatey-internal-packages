$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/069ec728-7a8c-465b-80d4-f8be3bee5728/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '0BDBA24E2D64A4DE639468CB1B196D2540D2B50ADF198B637F43CF563852BB58'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
