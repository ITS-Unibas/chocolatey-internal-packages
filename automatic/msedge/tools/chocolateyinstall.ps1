$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/b952218e-24c5-4116-a0e2-e0455dd346b4/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '4D4BB25526CFA6E91B22344D734ADE6C56A037EE4D1B43BA11DD93B39355BC46'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
