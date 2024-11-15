$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/93aa6c36-7437-4c82-b77a-8f78ade90455/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'ce09273fa2c0be6273ba151d51013aa74ae609b79d865682539758869f391075'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
