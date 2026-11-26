$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/58f85fae-b5f5-4443-9b8d-6d4cf627d6f6/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '45769d66809a9652050f8a91ab5329881b65cc4123fe7c733841deefbef91bf6'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
