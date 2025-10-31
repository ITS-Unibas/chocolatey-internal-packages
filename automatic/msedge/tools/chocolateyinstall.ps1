$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/14d43f8b-23cd-4f61-99ab-1b0254549771/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '56EA3B5205C924BD59E6826B34623B5845D11E34C317251F3252F1F8D8739613'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
