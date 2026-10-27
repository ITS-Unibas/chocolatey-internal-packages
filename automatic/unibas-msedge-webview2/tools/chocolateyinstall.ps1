$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/f699d81e-69ce-4b09-aa07-23ff2713045b/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '1c401b327fbc7bb9731b4e350a2194f083cbc3ede46508d52e1cae6610a39bea'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
