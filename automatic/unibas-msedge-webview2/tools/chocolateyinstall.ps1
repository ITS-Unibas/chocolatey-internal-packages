$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/1fcec104-a146-420d-8694-62f5c50c4ebf/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'c79735d360e591476e43c8f0603feec8abd21fad891486f856f0fe9620ad47f9'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
