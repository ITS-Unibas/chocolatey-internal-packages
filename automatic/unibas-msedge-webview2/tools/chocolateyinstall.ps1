$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/3c3a88db-f0bc-451e-8531-f609ab68eeb2/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '7aec5a4b4f334c16c5157b6a7c4756f0acb7d69383527f89b369394a8bcbb836'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
