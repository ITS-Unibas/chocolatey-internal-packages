$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/9d0afcd9-673f-4473-8ca1-3e8343752d19/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'B693CC34EB10FC63AEB3D8C65B1AA3F023DE84754770E3B692F95DCA3A14D792'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
