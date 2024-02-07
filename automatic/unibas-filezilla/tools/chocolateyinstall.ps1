$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'FileZilla*'
  url            = 'https://dl4.cdn.filezilla-project.org/client/FileZilla_3.66.5_win64-setup.exe?h=txy4k3OEnJovU5YZnSyA_Q&x=1707308593'
  checksum       = 'b5dc1c1a5d7112d19f225d14b0ba7e704994d619e6b2767be341cbeca885d933'
  checksumType   = 'sha256'
  fileType       = 'EXE'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
