$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/63f7af19-5d22-43ab-af18-239a7b23b84c/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '47bc51387aff95c1275ce38cfbbb5fbab99b43b33214049877bbcdbcc7a970d5'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
