$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/c09738bf-65db-4625-94c5-74ddd043edb9/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '671a2d59e812046628c6bdaf1aec80d994e03f25d8372edc187626facd5c17a1'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
