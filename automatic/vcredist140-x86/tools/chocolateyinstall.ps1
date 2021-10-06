$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x86'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/73b58d04-0049-47d1-9f54-1784792c71cd/80C7969F4E05002A0CD820B746E0ACB7406D4B85E52EF096707315B390927824/VC_redist.x86.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2015-2019 Redistributable (x86)*'
  checksum       = '80c7969f4e05002a0cd820b746e0acb7406d4b85e52ef096707315b390927824'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
