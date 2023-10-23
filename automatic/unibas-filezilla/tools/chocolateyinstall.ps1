$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'FileZilla*'
  url            = 'https://dl1.cdn.filezilla-project.org/client/FileZilla_3.66.0_win64-setup.exe?h=wvrsYADl8u-5a5TS19Vp8w&x=1698074898'
  checksum       = 'e0d1bbf26f540cb204b471e2c8decb2fd5a7ba2b5a1b4c0165652a7c9a84c195'
  checksumType   = 'sha256'
  fileType       = 'EXE'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
