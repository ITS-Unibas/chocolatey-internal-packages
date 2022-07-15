$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/4a067ebd-1766-4463-a54b-1e5a525cb90f/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '5DA115179E6D4C84B5204BC135ABCB81AA8512C2AD0909440663E8332EE20FD0'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
