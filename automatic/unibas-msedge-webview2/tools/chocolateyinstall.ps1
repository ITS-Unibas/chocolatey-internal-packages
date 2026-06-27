$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/e3e5accf-401e-46e6-aa1a-c3c7e5d03b8e/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'c8eea0a9a793d16df43beb7fe3873c6c5cab5e9119cfcbc59358f311cd8e4713'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
