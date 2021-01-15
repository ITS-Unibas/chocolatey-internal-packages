$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'powershell'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://github.com/PowerShell/PowerShell/releases/download/v7.1.1/PowerShell-7.1.1-win-x64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'PowerShell*'
  checksum       = 'D234CFD6E9DD4A2CA68BFBC64C416DE42F31760E954812E8ADE02B6D57FE243F'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
