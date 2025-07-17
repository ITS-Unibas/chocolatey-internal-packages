$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/e947d6c3-fb1e-4bf8-b19d-3bc2fd29b99d/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '3629841e7ebfc21dacb28f41b8313684c9a4bafb81bd782cd953f70d38d33ddb'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
