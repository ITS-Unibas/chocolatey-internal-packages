$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/0a9218ab-7dca-40e4-941f-d24d1d8e3970/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'fa07bc67c2a68763e127f6aabf5622b40a0220228899e78daf02ce2cc3971a50'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
