$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/c638b5d5-4b2f-4845-baab-c9f4fd6c58ab/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '8f0165de2f83174697bbdb273b6b53ea7d66bbc561d9a4ead5dacbfcbf8e8837'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
