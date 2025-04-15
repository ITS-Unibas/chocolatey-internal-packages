$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'FileZilla*'
  url            = 'https://dl3.cdn.filezilla-project.org/client/FileZilla_3.69.0_win64-setup.exe?h=e5FvWZv6EqhKZct8Zh-Jtw&x=1744728197'
  checksum       = 'ffba5c9d8b6550df595e3767d4a36856d739f54e4182721a1ea754ddebc1fcad'
  checksumType   = 'sha256'
  fileType       = 'EXE'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
