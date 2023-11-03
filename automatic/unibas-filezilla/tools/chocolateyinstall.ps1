$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'FileZilla*'
  url            = 'https://dl2.cdn.filezilla-project.org/client/FileZilla_3.66.1_win64-setup.exe?h=B0T0v3CsSyudMtOheaKnfQ&x=1699018888'
  checksum       = '72dd2d9247d78fae564056770c53f96acacf6e5129d5666c16cd80c300bf849a'
  checksumType   = 'sha256'
  fileType       = 'EXE'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
