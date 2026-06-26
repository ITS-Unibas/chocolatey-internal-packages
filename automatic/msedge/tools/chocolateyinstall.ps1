$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/82374039-b772-4d0a-a9a9-ee311dabec12/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'D026379848222D1E32800A1FF4268B9F5252A9D50F98819768BA54662F27979E'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
