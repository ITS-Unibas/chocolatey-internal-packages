$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/eb295810-08dc-4e76-b709-2dc2d52a4d37/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'b2fa4c4156c1a3e5dde5a9d2b5c397bc22dcccdc8b09a1406077aeac1f8a0d23'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
