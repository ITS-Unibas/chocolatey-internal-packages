$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/3e23fa35-d443-4e38-a9cf-ef11eced1622/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '543C0DFE13AB65747431FC7AC5DFAE56F4986C146D5F9042549A57462F21F7C2'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
