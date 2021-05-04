$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
# Old Camtasia versions can be found at https://www.techsmith.com/download/oldversions

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url     = 'https://www.python.org/ftp/python/3.9.5/python-3.9.5-amd64.exe'

  checksum    = '84d5243088ba00c11e51905c704dbe041040dfff044f4e1ce5476844ee2e6eac'
  checksumType= 'SHA256'

  silentArgs    = "/quiet"
  softwareName = "Python*"
  validExitCodes= @(0)
}



Install-ChocolateyPackage @packageArgs
