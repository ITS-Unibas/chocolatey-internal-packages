$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x86'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/5cc0a375-ebc5-4a27-8a76-aa43097a8949/ED1967C2AC27D806806D121601B526F84E497AE1B99ED139C0C4C6B50147DF4A/VC_redist.x86.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2015-2019 Redistributable (x86)*'
  checksum       = 'ed1967c2ac27d806806d121601b526f84e497ae1b99ed139c0c4c6b50147df4a'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
