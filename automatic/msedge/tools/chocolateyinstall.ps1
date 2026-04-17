$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/a7793e3c-0595-419c-bfc9-a891c92c6e53/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'F38CDE736A1B9A538D85832EBBA099E67F76C8C3EF781C559967C6AB95E1B130'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
