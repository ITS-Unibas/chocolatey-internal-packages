$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/83a2a636-f0d6-4fbd-9dd6-ffe7010332c0/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '38d4667a66a9be77675d1064918c4752ce41d0283e0c9b038fd1ca324deae4e1'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
