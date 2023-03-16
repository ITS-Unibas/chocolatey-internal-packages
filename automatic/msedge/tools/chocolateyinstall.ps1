$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/0b4a06fd-d919-4f32-8669-c67111aaa63a/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'DDD72EC1B584D5F5BE89A827656CD43AEC696BA1AA24AE53894B1AAD0AFC8ADE'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
