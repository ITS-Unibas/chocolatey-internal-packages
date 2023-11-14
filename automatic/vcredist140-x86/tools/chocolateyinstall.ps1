$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x86'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/a061be25-c14a-489a-8c7c-bb72adfb3cab/C61CEF97487536E766130FA8714DD1B4143F6738BFB71806018EEE1B5FE6F057/VC_redist.x86.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2015-2019 Redistributable (x86)*'
  checksum       = 'c61cef97487536e766130fa8714dd1b4143f6738bfb71806018eee1b5fe6f057'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
