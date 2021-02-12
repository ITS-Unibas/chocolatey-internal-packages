$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'powershell'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://github.com/PowerShell/PowerShell/releases/download/v7.1.2/PowerShell-7.1.2-win-x64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'PowerShell*'
  checksum       = '8381D72E31415B533FCFD349E3AF1A62EFA8C793202A260C1C724D10C25BB49D'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
