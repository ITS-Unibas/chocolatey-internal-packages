$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/d6c50665-06a3-4ebe-8bde-7e408a78f093/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '9b0142e22e8daa92855d746ae4d1e9eeef561ccaf67d1dd452165c4af3df3191'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
