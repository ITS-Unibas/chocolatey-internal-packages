$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/ec95ce57-49d2-4a16-b92b-2994e1aea498/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '8749245959664BDE1862BE4D152C5C87CE1BD47509BF09636E186E5A208817CB'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
