$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/07e65991-04aa-4d97-b6d0-22de7d04fb81/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'BA1C2944001357C982C71B00DAB4056B6DCB7EBF5FA1AC247CA28C6B6ECAAD39'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
