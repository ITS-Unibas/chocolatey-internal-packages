$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/49e1c764-971b-451c-85b5-02adbbf2f09f/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '8f47a5f73d97921ad3ee7c1be3d983d19d21d99ae54842726477aaa82e500472'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
