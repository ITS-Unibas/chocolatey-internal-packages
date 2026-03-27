$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/cbd65e96-0e75-421d-8359-f219338e6ce2/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'A29F10581E9A284058EB77AE5B5E72292C6C0D15CC9AA03769EB901EDFD3C067'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
