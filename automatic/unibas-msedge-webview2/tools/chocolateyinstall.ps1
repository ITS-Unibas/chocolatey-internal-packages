$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/06fb6ad8-1976-4e78-9ceb-3ae170edebde/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '771042db15cb5c463bac51a8408e70183d7130e8ac946709384c2223da582c1b'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
