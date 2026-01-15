$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'Wireshark*'
  fileType       = 'exe'
  url            = 'https://2.na.dl.wireshark.org/win64/Wireshark-4.6.3-x64.exe'
  checksum       = '09db2e7365b8dc56bc293b5e2849d9d06ebd8411f5a5e72e528964fbb051f283'
  checksumType   = 'sha256'
  silentArgs     = '/S /quicklaunchicon=no'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
