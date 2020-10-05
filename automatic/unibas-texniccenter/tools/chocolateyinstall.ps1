$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'TexnicCenter*'
  fileType       = 'EXE'
  url            = 'http://sourceforge.net/projects/texniccenter/files/TeXnicCenter/2.02%20Stable/TXCSetup_2.02Stable_x64.exe/download'
  checksum       = '85457AADB9709E4D5CDB6A4EDADE21023FB4700CFAD57DFFB8315088B670102B'
  checksumType   = 'sha256'
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
  validExitCodes = @(0)
}


Install-ChocolateyPackage @packageArgs
