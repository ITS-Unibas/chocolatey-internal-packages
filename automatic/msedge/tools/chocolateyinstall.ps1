$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/03acc8f1-3ba6-48ad-a8ae-7eec0779ca69/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '4925CA0E829D6643FDC9699878CF0ACEE6DE4B2578417103CB05999E8B741128'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
