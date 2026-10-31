$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/d5cc3c1c-bb59-4158-aedc-db0035e44466/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '62863f0f0611a16ccf124b4f15650c3b66624504eba74d7cde1e2ae5d951249b'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
