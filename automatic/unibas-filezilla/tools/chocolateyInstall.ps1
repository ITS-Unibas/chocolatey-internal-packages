$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'FileZilla*'
  url            = 'https://dl3.cdn.filezilla-project.org/client/FileZilla_3.67.1_win64-setup.exe?h=ryoyk4Q0hL_B_vOQrhC5Xw&x=1728309328'
  checksum       = ''
  checksumType   = 'sha256'
  fileType       = 'EXE'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
