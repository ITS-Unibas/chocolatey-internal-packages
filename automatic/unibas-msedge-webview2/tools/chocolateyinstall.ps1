$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/8f44a422-aef5-4a11-9767-0d5dcc7db883/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '94f8411d30d9916c2b037feaaa358d3a94ee86e320a494deb5f53cc1d36132f3'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
