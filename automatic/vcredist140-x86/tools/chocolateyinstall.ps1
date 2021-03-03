$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x86'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/d64b93c3-f270-4750-9e75-bc12b2e899fb/4521ED84B9B1679A706E719423D54EF5E413DC50DDE1CF362232D7359D7E89C4/VC_redist.x86.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2015-2019 Redistributable (x86)*'
  checksum       = '4521ed84b9b1679a706e719423d54ef5e413dc50dde1cf362232d7359d7e89c4'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
