$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/8a3b9132-c715-46c8-a9b4-be64be6fc54d/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '936d42ccb5383de720a59f28bddab6ab4b793148a59e2524a01aa7ab027d5695'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
