$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'Wireshark*'
  fileType       = 'exe'
  url            = 'https://2.na.dl.wireshark.org/win64/Wireshark-4.4.8-x64.exe'
  checksum       = '8e31aa3deda2708887c732ded9b984a9771c7254a257274bbbb8dabd4959df4e'
  checksumType   = 'sha256'
  silentArgs     = '/S /quicklaunchicon=no'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
