$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/0e7c1ee2-384e-443d-bf88-1e2e98fd90a5/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'd5c3f8a30c3c09fee7041031d54ab67618c2726bdc0f123c919fe6a38d01221c'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
