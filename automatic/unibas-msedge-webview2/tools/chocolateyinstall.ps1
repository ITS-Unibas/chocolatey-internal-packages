$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/01e4f69c-c4af-40f3-9c73-dbc57c3a6d97/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '445c04fd9b498a5e2750ff955abaa68e1861d589c9a15d08ea4741ee80719794'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
