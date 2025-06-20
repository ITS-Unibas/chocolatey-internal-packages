$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/ecda4fc4-af6b-43e1-a9a8-88b8be02ea83/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '9a262f309fe9a0dd10d83881b040596825b2612e45d1c4bbdb1b75622bcdad68'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
