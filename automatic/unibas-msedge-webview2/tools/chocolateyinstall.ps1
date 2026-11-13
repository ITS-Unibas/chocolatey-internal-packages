$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/14f2cd10-e392-45ff-a699-5e08c803d4c7/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '1d1c838e5971343c060415da7c630c3c1ca7ad33fbb61cca660f3c1122f4cca8'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
