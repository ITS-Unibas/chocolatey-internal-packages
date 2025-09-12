$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/996ec488-5989-48a0-92e5-1197610ffdf6/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '71fa9c7a7bbc952b5cd42bbe29d5a312581e6000d4c516ad1ef47c418fffc818'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
