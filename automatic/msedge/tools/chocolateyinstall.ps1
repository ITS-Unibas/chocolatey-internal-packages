$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/01fd594e-ec23-4691-b36d-411f29e071c7/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'BE9F15E8679C8F61E9E6E165B5F68F3F959E61B348861C60C25CBB8F0C2F1786'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
