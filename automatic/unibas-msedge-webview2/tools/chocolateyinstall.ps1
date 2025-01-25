$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/db0f10d9-a730-4884-a505-2cadd7fa5f74/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '40df76cdc747197b7691e35401d07ca01a8a70206e2186c51a7b8d2fd10f5760'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
