$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/d6891996-d2fb-4e23-aeed-f9597bab3cd9/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '5a34e8e58f2b454ef7842062da96d66f36f271ffe7a6fb14285f6dd21cd64957'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
