$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'powershell'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://github.com/PowerShell/PowerShell/releases/download/v7.2.4/PowerShell-7.2.4-win-x64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'PowerShell*'
  checksum       = '06B93C2263FBD6D975AC59E09AB2390635AFF0455AD2504FFD60F0A5E0E61103'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
