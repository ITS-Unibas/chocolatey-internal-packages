$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'FileZilla*'
  url            = 'https://dl1.cdn.filezilla-project.org/client/FileZilla_3.66.4_win64-setup.exe?h=bF43FjFB-3WTeggf4rIABA&x=1703136487'
  checksum       = '35ea6fac8fcb1c9826647c345a3152e1e7e8903d81b5df1032d6670c1f564b84'
  checksumType   = 'sha256'
  fileType       = 'EXE'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
