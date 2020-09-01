$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'http://dl.delivery.mp.microsoft.com/filestreamingservice/files/789ec525-0feb-4d62-a24b-99fd15d117e4/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '168A11A5152396159687D9E2AAEF8052E908C10A2B39B04824D669E21930368B'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
