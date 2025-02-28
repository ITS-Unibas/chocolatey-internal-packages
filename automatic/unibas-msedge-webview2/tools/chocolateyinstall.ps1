$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/67aa13d9-ee72-4563-acf8-946e91990ee6/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'c249c5ffe48b24bbcfa0b3a51e4a50a5e49f69daf367085351a87837f5b590f2'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
