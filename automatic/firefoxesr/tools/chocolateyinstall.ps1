$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/115.9.0esr/win64/en-US/Firefox%20Setup%20115.9.0esr.msi'
  checksum      = '6997bd304dcd302717c7c875e95aafff31f6bb82f369c5dc5df2497f90ea84c8841c52e85193c9eaebec8b85ab008992d46153e330484dea8315ce66d4f6ca98'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
