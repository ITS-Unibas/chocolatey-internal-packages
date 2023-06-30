$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'FileZilla*'
  url            = 'https://dl2.cdn.filezilla-project.org/client/FileZilla_3.65.0-rc1_win64-setup.exe?h=Qt5z356NK7bssN3hbmcCGQ&x=1688113980'
  checksum       = '2a09b3ce162a699178dc1eeb4d495c5b7356585c36ee89d50c09a1539645da17'
  checksumType   = 'sha256'
  fileType       = 'EXE'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
