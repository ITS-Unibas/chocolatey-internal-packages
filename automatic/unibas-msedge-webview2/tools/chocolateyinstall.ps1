$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/cc09d8dc-3a65-42af-8e25-7e606b6e33a6/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '5351934a30d7fba6ee3a1b17cfe7d785c0738081a97182992bd4c6302d1ade28'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
