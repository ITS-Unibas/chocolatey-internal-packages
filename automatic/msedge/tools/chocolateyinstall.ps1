$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/0d5f98e6-819e-49ab-8dc3-e65d8f27815b/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'DF10F35A2A8C38D0D368F9F093FCBB04D96C170DD370267F8C158CD8E0D147C0'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
