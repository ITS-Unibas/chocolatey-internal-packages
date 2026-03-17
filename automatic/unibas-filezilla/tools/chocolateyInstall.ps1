$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'FileZilla*'
  url            = 'https://dl4.cdn.filezilla-project.org/client/FileZilla_3.69.1_win64-setup.exe?h=Dhd7YVCdeIhh6BESWeyEiA&x=1745419433'
  checksum       = '6cbd5fdb157a7851cdd32b9a61d6136a31a5fa05fb36fd9403b920b708c9125e'
  checksumType   = 'sha256'
  fileType       = 'EXE'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
