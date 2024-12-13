$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/7f618f06-9025-487d-ab14-94c04d7c9465/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '82ea292f1cd05146ba2b1aae9f4a75893184f609ca1b48e25c0776d6588ae15d'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
