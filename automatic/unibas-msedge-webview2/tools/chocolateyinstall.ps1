$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/5a16eb19-26ed-4f1b-996e-b438848bb74a/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '9915c97304977e2d11877b03e07a7fcdd10d4277b2297c5a5113d414fc6ae6b3'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
