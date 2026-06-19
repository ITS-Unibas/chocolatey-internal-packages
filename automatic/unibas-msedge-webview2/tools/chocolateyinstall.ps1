$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/7aa64b7d-9989-44f8-b1ac-6871e165c982/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '24172d2178212167522b91995b95dd5d2dadc8e7310591535d194524eea090e8'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
