$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'Wireshark*'
  fileType       = 'exe'
  url            = 'https://2.na.dl.wireshark.org/win64/Wireshark-4.6.6-x64.exe'
  checksum       = ''
  checksumType   = ''
  silentArgs     = '/S /quicklaunchicon=no'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
