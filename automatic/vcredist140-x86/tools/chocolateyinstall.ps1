$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x86'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/9fe82b83-f3a1-43f5-8f25-ebe24529854c/B4D433E2F66B30B478C0D080CCD5217CA2A963C16E90CAF10B1E0592B7D8D519/VC_redist.x86.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2015-2019 Redistributable (x86)*'
  checksum       = 'b4d433e2f66b30b478c0d080ccd5217ca2a963c16e90caf10b1e0592b7d8d519'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
