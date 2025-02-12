$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x64'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/285b28c7-3cf9-47fb-9be8-01cf5323a8df/8F9FB1B3CFE6E5092CF1225ECD6659DAB7CE50B8BF935CB79BFEDE1F3C895240/VC_redist.x64.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2015-2019 Redistributable (x64)*'
  checksum       = '8f9fb1b3cfe6e5092cf1225ecd6659dab7ce50b8bf935cb79bfede1f3c895240'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
