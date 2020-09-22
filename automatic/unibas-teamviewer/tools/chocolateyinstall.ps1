$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'unibas-teamviewer'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://dl.teamviewer.com/download/version_15x/Jmp-91/TeamViewer_Setup.exe'
  silentArgs     = '/S /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'TeamViewer*'
  checksum       = '441c21970a08ae66b331719c295a5f397fd486859fef20382251da57fafe9541'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
