$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/89620190-81af-46a2-bb59-6228918a312e/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '358a11cff88ce519301c3b60bcefe848f922688ab0a333fc0f18ddf83bb3b4f3'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
