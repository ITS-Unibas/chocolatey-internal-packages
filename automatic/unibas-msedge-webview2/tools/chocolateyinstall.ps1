$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/1265dc93-6edd-42b3-8bfe-36edae817450/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '35b13b3c5d1edf306f0bdebb4507158cc7f78cac8489db91d8508d5c04cf2731'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
