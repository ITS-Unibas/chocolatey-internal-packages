$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/91.2.0esr/win64/en-US/Firefox%20Setup%2091.2.0esr.msi'
  checksum      = '40d91fd315f157a1d33314d7fe6638c48a16790cc20e08cf143085f5de663ac2034b15f66be4b8e26a5d56308d70baf752c4e1f3aafe70f66634f7ac3a089822'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
