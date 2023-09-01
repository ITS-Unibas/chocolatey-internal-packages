$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/1512a322-62a1-43e0-a64f-6dd48cea87e8/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'B9BBA0DA7981C2991CA224C9654B0B17FCF8766D88BB26387089AB1069E00BC3'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
