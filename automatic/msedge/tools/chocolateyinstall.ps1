$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/be446108-f4a5-446d-9738-a3eb4fc475f6/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'E6FBEB15752F91B526F228526DAE65030B719D7DCA210C72EDB98A7E4F05A18E'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
