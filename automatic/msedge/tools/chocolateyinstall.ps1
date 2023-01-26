$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/e5e2bd3c-8578-46ba-9663-58385df4202f/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '4D36D314EC1343E0F5EA37A9991FAAF3E272F8FB719B02974D0FD071ED37668F'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
