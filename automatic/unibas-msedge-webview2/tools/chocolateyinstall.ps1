$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/674040a6-8143-4ec3-80ed-9283e1a69c06/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '0b409b891a8523c1614aa2daed8e72847b7b54abb4330eae6daaaabb10740295'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
