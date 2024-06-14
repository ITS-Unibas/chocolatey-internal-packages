$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/3bbec756-02a0-4bf2-a403-e59c89eee4ae/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'D2ECDEB8650AB7E60441881B022E692DC59603865A78070BDF1745B27C9BD111'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
