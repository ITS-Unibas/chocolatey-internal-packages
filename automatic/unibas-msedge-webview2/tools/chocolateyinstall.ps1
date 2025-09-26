$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/47d98449-d84a-4345-a962-bbe40ef54602/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'df252fee23d3464d19c7ef2833c89958140d1d0fe555e91d8e2fe87a8a352d82'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
