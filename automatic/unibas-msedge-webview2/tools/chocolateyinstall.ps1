$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/22845a8e-4143-4806-a5cd-c6908efc8dce/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '4969954ed6bd0362e7208d45c67a3c434aff2e48474a5e97c6a4383517c20806'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
