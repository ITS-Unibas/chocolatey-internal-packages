$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'unibas-teamviewer'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://dl.teamviewer.com/download/version_15x/Jmp-91/TeamViewer_Setup.exe'
  silentArgs     = '/S /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'TeamViewer*'
  checksum       = '3533583640b45b51cdde21f12c6389a7cdeb28e603c2289208f28c76c6b15365'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
