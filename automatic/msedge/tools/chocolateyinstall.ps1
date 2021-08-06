$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/354a3197-be46-4cad-b0cf-49b608c57a5b/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '6E8C8D6B8B48142CA743C29B2B62C04A59F92CEC138C02B2066EC96EE4AD656D'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
