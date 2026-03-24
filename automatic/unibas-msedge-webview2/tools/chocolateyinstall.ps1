$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/1b4b89db-981d-4b16-8801-bedc4094c84f/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '173bd760a3ff0c1c3e78f760b92a5de23ee7188c86c61824759e2f040923c5af'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
