$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/31bc99c9-c941-4194-8b61-4a59287bdfbd/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '7D5C9369E0F58951F97231F9AA8D526DECBAA793BB3CA7F13262CB4DBF04242A'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
