$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/33afdac1-33dd-4ee8-b08c-0d33be4dddb4/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '4d4466068a7f7e6d26c584abc355e23bf622617703f4830b3aea2a3de5344e91'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
