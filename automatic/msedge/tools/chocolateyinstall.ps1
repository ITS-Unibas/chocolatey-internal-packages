$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/d50edaf7-3482-4add-80f3-4c208b971c0e/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'E3960F2DEBCE3BA0D7221710FE27972A84B5E30F2B9AA789BB5DD83D06AB67AB'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
