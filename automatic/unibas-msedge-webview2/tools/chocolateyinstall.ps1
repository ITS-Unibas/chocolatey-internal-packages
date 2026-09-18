$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/dbeb55e4-187c-441f-8068-884086b87658/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '493ae586ff07ef3696da3bde3aeb73d6caca8a1c00e779da899ff16a159cf36e'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
