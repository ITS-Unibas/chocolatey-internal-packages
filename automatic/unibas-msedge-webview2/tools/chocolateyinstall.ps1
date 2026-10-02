$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/d7548c8b-0dc9-4e81-87dd-a346cc9b73a5/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'f6df8e4bc857786ff641cd01da1449169eaf8236c936ced485ea61685ba4da40'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
