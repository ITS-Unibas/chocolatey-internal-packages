$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x86'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/71c6392f-8df5-4b61-8d50-dba6a525fb9d/510FC8C2112E2BC544FB29A72191EABCC68D3A5A7468D35D7694493BC8593A79/VC_redist.x86.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2015-2019 Redistributable (x86)*'
  checksum       = '510fc8c2112e2bc544fb29a72191eabcc68d3a5a7468d35d7694493bc8593a79'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
