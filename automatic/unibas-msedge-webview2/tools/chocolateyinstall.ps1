$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/7a700eba-24af-452b-88f1-7625cf472b9b/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '145aa4146e0fa84438484db31c5c120824c4556c5e939dab33e0af07a61da551'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
