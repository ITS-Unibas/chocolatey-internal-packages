$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/16336785-5d6e-466f-82fd-37c292a21d7a/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'f8819c0f74a2f9b175b12553149f53370a766c5570f0390b0c2f94e26aa94cd3'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
