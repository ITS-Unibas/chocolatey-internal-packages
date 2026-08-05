$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
# Old Camtasia versions can be found at https://www.techsmith.com/download/oldversions

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url     = 'https://www.python.org/ftp/python/3.14.7/python-3.14.7-amd64.exe'

  checksum    = '9d9eb2709ef81bf5cd30db3c2096bdbc4ea10087c22e62f27d356b36f6ae9649'
  checksumType= 'SHA256'

  silentArgs    = "/quiet"
  softwareName = "Python*"
  validExitCodes= @(0)
}



Install-ChocolateyPackage @packageArgs
