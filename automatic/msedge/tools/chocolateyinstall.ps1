$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/db806d38-6a33-4321-9fe2-6f611dc6723c/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '451B678F001E4E2937F48C68F2A58A77CB997D0B59C8E5019A361EEAD77DE783'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
