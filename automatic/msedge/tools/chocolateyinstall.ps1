$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/ff0243ba-cebc-4cbc-b6f2-45a2fbe49f0d/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '697B966E256FEC93364939C8412A655D1E433CFC63F85A2A47E2DE60BC248527'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
