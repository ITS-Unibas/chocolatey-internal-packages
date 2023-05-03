$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://dl3.cdn.filezilla-project.org/client/FileZilla_3.64.0_win64-setup.exe?h=hg2sj1COks-ZJg5ysya0cg&x=1683122966'
  checksum       = '0d8f5dbe4a1f05ddacda6493733bed57fc54310c90bc6fdc764fb95a92441b40'
  checksumType   = 'sha256'
  fileType       = 'EXE'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
