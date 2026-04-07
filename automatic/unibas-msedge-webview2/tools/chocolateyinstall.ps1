$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/95a205f2-db57-43a9-9248-bf1c7115d53a/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'd5a69509ddc5da817c7c3fab1833e605f7ae4cefa60487a1e7df88398419f076'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
