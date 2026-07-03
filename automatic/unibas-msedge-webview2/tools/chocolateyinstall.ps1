$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/ee9caa0e-313c-4ec3-9165-ec3226dee379/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '1d43ef423bd14107962c69c5cb6bcb1c531950f88b2579502c52fb64d6b44d4a'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
