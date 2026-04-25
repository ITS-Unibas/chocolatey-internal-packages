$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/74dcb3ad-6bec-4212-bd0e-1f18ace9858a/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '665506642bd88c3faba25c400db9dc5bb2a1a6863f4f60d9b473e47940a9de33'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
