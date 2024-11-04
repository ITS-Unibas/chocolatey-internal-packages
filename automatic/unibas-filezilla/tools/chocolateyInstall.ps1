$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'FileZilla*'
  url            = 'https://dl1.cdn.filezilla-project.org/client/FileZilla_3.68.1_win64-setup.exe?h=PXni_q3vSL9jMHx7LvAMbA&x=1730741895'
  checksum       = '1feb6c12f584e98f9fddf95bf128f549310c738376fab82a5893eafed765ad83'
  checksumType   = 'sha256'
  fileType       = 'EXE'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
