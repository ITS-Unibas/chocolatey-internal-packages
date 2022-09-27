$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/a2634899-8542-43ae-899b-e24c18e4b716/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '7F6A3D604E077C03FDD7852356F39FEE79FCBA710937C7F245F421600EFC2261'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
