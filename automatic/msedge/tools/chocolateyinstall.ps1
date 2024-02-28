$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/651d4928-27ae-434c-ab55-776f68fe784c/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'B4D52394683D3C0B3A9C9274A39E670B733CE54163B1F07CB1AB3311D28789D9'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
