$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/015169fc-29a1-466f-bba5-e56ebd83a68b/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '1D58D8F5F2273F93BA1E35EF02C666E49CA174C796018D225F941A744738DB4C'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
