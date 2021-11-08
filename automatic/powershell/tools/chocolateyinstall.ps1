$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'powershell'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://github.com/PowerShell/PowerShell/releases/download/v7.2.0/PowerShell-7.2.0-win-x64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'PowerShell*'
  checksum       = 'BD5BDDF2FAC4626479C4F381BDB30A0DC6A9516BE2DE9FC726F33C65F56FE9D4'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
