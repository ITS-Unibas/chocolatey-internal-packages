$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/a0ca432d-917b-4168-9411-49a0fd9f473d/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '3c9e71c32d9eee0215fa46b33f1068c1df055eae732ab1a90838e2069bae326e'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
