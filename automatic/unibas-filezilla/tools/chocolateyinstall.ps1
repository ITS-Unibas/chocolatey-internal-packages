$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'FileZilla*'
  url            = 'https://dl4.cdn.filezilla-project.org/client/FileZilla_3.67.0_win64-setup.exe?h=wnq3OWpEIGljPx8KaG9Ryg&x=1713245428'
  checksum       = 'd7e11b178fcc3d1ee7f6ad3dce6da2ea043de64d521cf3578fb09031cbdb0ae2'
  checksumType   = 'sha256'
  fileType       = 'EXE'
  silentArgs     = '/S'
  validExitCodes = @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
