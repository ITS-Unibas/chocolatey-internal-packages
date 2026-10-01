$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
# Old Camtasia versions can be found at https://www.techsmith.com/download/oldversions

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url     = 'https://www.python.org/ftp/python/3.14.8/python-3.14.8-amd64.exe'

  checksum    = '759be887b96e736a3ca886daf8d575f18fcae1a09efab6902f42d59e8999f8ef'
  checksumType= 'SHA256'

  silentArgs    = "/quiet"
  softwareName = "Python*"
  validExitCodes= @(0)
}



Install-ChocolateyPackage @packageArgs
