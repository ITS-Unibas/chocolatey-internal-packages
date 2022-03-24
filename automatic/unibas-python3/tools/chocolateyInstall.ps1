$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
# Old Camtasia versions can be found at https://www.techsmith.com/download/oldversions

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url     = 'https://www.python.org/ftp/python/3.10.4/python-3.10.4-amd64.exe'

  checksum    = 'a81fc4180f34e5733c3f15526c668ff55de096366f9006d8a44c0336704e50f1'
  checksumType= 'SHA256'

  silentArgs    = "/quiet"
  softwareName = "Python*"
  validExitCodes= @(0)
}



Install-ChocolateyPackage @packageArgs
