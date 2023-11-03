$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/124a217d-38f3-4836-85bd-1d8ebede07bc/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'D551D4961DB62F5284C83024EE30E8687DAE046DF5AA61847B698A0BED6AD328'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
