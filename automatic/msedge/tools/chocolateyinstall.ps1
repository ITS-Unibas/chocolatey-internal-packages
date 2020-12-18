$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/917239b4-8cc3-4004-a9ea-572f0411458a/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '806B58846F0A652DB192EFB594AD0CB0CDFCB896485114DB2730D8B9EFB16836'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
