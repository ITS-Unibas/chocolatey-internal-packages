$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'Wireshark*'
  fileType       = 'exe'
  url            = 'https://2.na.dl.wireshark.org/win64/Wireshark-4.4.3-x64.exe'
  checksum       = '44524f1abd1ac0f550e77516527d70a2ab4a1d88273947608e3200a42f792f2c'
  checksumType   = 'sha256'
  silentArgs     = '/S /quicklaunchicon=no'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
