$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = ''
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'BF20402279F264DBB6DAADB933939808198071DDBA479AF8212D156A1A3E1252'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
