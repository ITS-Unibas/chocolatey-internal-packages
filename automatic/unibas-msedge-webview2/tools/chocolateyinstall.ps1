$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/605518b3-4362-4a02-b46c-5981ed931543/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '91d910fd7f39fd308c09e89541684d061017df8f767aaa498abe2703ccf76113'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
