$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x86'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/2c6b06c4-dc6a-4496-b769-b0d311cf515d/54CCBBC0663064F0B57442DC986511B90F3CFAAB23524087B0711E6FA214CB26/VC_redist.x86.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2015-2019 Redistributable (x86)*'
  checksum       = '54ccbbc0663064f0b57442dc986511b90f3cfaab23524087b0711e6fa214cb26'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
