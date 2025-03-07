$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/273c3042-3edb-46b2-8035-27eaa51393b1/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '376dbcb7daa9cc2689b3518fa0bd7f02712d5af24b73cce5ffe1fdec4b7d72eb'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
