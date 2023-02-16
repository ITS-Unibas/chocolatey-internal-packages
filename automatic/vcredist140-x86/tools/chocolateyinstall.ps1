$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x86'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/77091a7f-1547-40bd-96a6-575b3e7fb174/8AE59D82845159DB3A70763F5CB1571E45EBF6A1ADFECC47574BA17B019483A0/VC_redist.x86.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2015-2019 Redistributable (x86)*'
  checksum       = '8ae59d82845159db3a70763f5cb1571e45ebf6a1adfecc47574ba17b019483a0'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
