$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x86'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/40b59c73-1480-4caf-ab5b-4886f176bf71/435A0DE411B991E2BFC7FD1D5439639E7B32206960D3099370E36172018F52FE/VC_redist.x86.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2015-2019 Redistributable (x86)*'
  checksum       = '435a0de411b991e2bfc7fd1d5439639e7b32206960d3099370e36172018f52fe'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
