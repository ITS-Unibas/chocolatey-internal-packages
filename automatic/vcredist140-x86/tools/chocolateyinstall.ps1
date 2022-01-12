$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x86'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/7e8edcf6-f2c1-41b1-a712-3f9cd8f58db4/4C6C420CF4CBF2C9C9ED476E96580AE92A97B2822C21329A2E49E8439AC5AD30/VC_redist.x86.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2015-2019 Redistributable (x86)*'
  checksum       = '4c6c420cf4cbf2c9c9ed476e96580ae92a97b2822c21329a2e49e8439ac5ad30'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
