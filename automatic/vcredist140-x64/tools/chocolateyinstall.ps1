$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x64'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/fd5d2eea-32b8-4814-b55e-28c83dd72d9c/952A0C6CB4A3DD14C3666EF05BB1982C5FF7F87B7103C2BA896354F00651E358/VC_redist.x64.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2015-2019 Redistributable (x64)*'
  checksum       = '952a0c6cb4a3dd14c3666ef05bb1982c5ff7f87b7103c2ba896354f00651e358'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
