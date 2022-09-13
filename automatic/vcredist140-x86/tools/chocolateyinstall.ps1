$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x86'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/7331f052-6c2d-4890-8041-8058fee5fb0f/CF92A10C62FFAB83B4A2168F5F9A05E5588023890B5C0CC7BA89ED71DA527B0F/VC_redist.x86.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2015-2019 Redistributable (x86)*'
  checksum       = 'cf92a10c62ffab83b4a2168f5f9a05e5588023890b5c0cc7ba89ed71da527b0f'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
