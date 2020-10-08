$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'http://dl.delivery.mp.microsoft.com/filestreamingservice/files/4e226098-5573-4b9c-81c3-3610acf2cadb/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '028753783256653B90DB3BBFEEDC4C6E35302F26A5E7FBEA70427A9EB415E30A'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
