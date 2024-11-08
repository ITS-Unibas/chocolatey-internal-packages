$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/91c9f3ef-cbc0-4380-a98d-8662fbca35f6/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '84BA997B57BB7B4EE4222816D2202D090F8002874A3FBA6EF54F11A74CFF1BD4'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
