$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/496c649f-7368-49c6-8498-b0d1c072189e/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '11183F57988186F21643AFA90E22D76B3FBAA740B07379AA2254E752AACED19C'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
