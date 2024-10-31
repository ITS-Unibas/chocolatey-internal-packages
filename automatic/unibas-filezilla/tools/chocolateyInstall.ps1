$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'FileZilla*'
  url            = 'https://dl2.cdn.filezilla-project.org/client/FileZilla_3.68.0_win64-setup.exe?h=7Q6Xg1liMeyLcH-NK734Tg&x=1730377672'
  checksum       = '5670c295f7f228e7fa9504aa6a7796aa24c0793d01fe999c1e7302da506e17c0'
  checksumType   = 'sha256'
  fileType       = 'EXE'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
