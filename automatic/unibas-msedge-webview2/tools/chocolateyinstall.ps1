$ErrorActionPreference = 'Stop';

$Version = '90.0.818.51'
$packageName = 'unibas-msedge-webview2'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://its-ld-core-p01.its.p.unibas.ch/swd/05 Prod/Microsoft/WebView2/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
$fileLocation = Join-Path $toolsDir 'MicrosoftEdgeWebView2RuntimeInstallerX64.exe'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  file           = $fileLocation
  url            = $url
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'BF20402279F264DBB6DAADB933939808198071DDBA479AF8212D156A1A3E1252'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
