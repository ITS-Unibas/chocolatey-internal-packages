$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'micro-manager'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://valelab4.ucsf.edu/~MM/builds/2.0/Windows/MMSetup_64bit_2.0.0.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'Micro-Manager*'
  checksum       = '774ec9fe484f36776adccbb43055f87cc665128c71c8b94f9d4ad097247497d7'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
