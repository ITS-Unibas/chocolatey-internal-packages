$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/a98e1079-88e9-4466-a014-6b9263129d5a/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '4E342CE5707A20C2987415BDBCEA44AADE6471BFAA76BDA3F9BAD9053633FEAE'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
