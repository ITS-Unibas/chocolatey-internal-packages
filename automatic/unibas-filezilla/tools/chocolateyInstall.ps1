$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'FileZilla*'
  url            = 'https://dl3.cdn.filezilla-project.org/client/FileZilla_3.67.1_win64-setup.exe?h=ryoyk4Q0hL_B_vOQrhC5Xw&x=1728309328'
  checksum       = '3bc0169e8a3ce0e28240b5c02a06bb59568b27b611850cce26ed95ce54f43454'
  checksumType   = 'sha256'
  fileType       = 'EXE'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
