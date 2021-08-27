$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/734efada-a5dc-435d-a362-35cafffced51/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '814A8D91AE9E6A3E99DB7210AE7FE37CB2542BA807CBBA1A7201D644D7105A54'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
