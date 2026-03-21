$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/f692d627-f064-4dd3-94b4-7ac7ce0ac3c8/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '3359725BC57DFB5ADC038B4C22B71105266689A2245C9F2CAD9048BAFD77693C'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
