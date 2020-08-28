$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'http://dl.delivery.mp.microsoft.com/filestreamingservice/files/6411fb49-7783-4a44-ae8d-6934c387df80/MicrosoftEdgeBetaEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '877312FBAD8DA6A200D36436F4B210865B0B47108BD46DD38BD593F01530BC9E'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
