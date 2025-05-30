$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/0d3598be-3322-4e98-91e5-cc38333e5f49/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'a1ea26760e1175e807e38856b3c806114aa374cc38e4b602c5a6173d7c4c551e'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
