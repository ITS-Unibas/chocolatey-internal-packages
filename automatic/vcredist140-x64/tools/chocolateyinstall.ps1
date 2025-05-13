$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x64'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/2c6b06c4-dc6a-4496-b769-b0d311cf515d/463F736D5925566EDC0E8F7D8E70C0A1FC95ADF44AFA5D5390B979F5A35934CC/VC_redist.x64.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2015-2019 Redistributable (x64)*'
  checksum       = '54ccbbc0663064f0b57442dc986511b90f3cfaab23524087b0711e6fa214cb26'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
