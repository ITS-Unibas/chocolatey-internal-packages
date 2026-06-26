$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/80e6272b-c3ba-410f-b75c-fdd600e16064/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'a8e01e94f7b92fd6be737ac5a93cbe5208581de45a88ba2ddca55c8dc8478f57'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
