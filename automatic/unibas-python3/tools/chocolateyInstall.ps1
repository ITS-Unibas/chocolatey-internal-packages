$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
# Old Camtasia versions can be found at https://www.techsmith.com/download/oldversions

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url     = 'https://www.python.org/ftp/python/3.11.5/python-3.11.5-amd64.exe'

  checksum    = '1bb46f65bb6f71b295801c8ff596bb5b69fa4c0645541db5f3d3bac33aa6eade'
  checksumType= 'SHA256'

  silentArgs    = "/quiet"
  softwareName = "Python*"
  validExitCodes= @(0)
}



Install-ChocolateyPackage @packageArgs
