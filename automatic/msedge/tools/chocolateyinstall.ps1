$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/7a5f4ce6-c842-4b7c-921c-9356ed932be3/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '5C65E38D4CAB550A81ACC19C3C8A02833380693B8E429424B409661D2B0B9F29'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
