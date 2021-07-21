$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x86'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/888b4c07-c602-499a-9efb-411188496ce7/F3A86393234099BEDD558FD35AB538A6E4D9D4F99AD5ADFA13F603D4FF8A42DC/VC_redist.x86.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2015-2019 Redistributable (x86)*'
  checksum       = 'f3a86393234099bedd558fd35ab538a6e4d9d4f99ad5adfa13f603d4ff8a42dc'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
