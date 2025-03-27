$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/d112c788-ed95-4b00-bd8a-491f69788bc8/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '40E549AD15DD23211074BEF093CAF7FEB5025386501F438D5555D6D4F09AF5CE'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
