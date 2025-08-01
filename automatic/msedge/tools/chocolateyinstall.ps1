$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/e7254270-fef3-463a-abf7-07821e603a86/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '57A9D9BE1D5FD9ACAD4AA02B6C8E85A616868CA7B6549244A8FBAF3B69E3E86F'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
