$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'TexnicCenter*'
  fileType       = 'EXE'
  url            = ''
  checksum       = ''
  checksumType   = 'sha256'
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
  validExitCodes = @(0)
}


Install-ChocolateyPackage @packageArgs
