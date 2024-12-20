$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/25f87a1b-c908-4891-8413-aafe026f89cf/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '5f6f96fb70294e8c92e269a20f6e3954cd5614e1c6df5eb8fc8db30732560dcf'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
