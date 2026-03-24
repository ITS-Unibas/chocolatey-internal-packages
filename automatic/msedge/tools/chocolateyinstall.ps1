$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/1bbe93ec-f5ce-4774-8497-e7d2bb412aa8/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '90FB5EF8484D43CB6E20FF9D2EB862E3960018EF4E5C90D79E170C326953FB0C'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
