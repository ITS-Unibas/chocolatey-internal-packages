$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/102.0.1esr/win64/en-US/Firefox%20Setup%20102.0.1esr.msi'
  checksum      = 'cc7b752b93df707ba86b6737794304031de6a326470d1fdf6b5fc987f081c5745738953bff44ea01670ce88554fd3bf697ddbd4cef5b9f19839f18e8ece697ae'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
