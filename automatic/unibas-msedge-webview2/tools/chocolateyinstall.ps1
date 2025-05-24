$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/6e1e9052-dcb3-41e3-9aec-a7880afb75b2/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'f95a3c066a51b714c8a5715ae8b583c9733db2241a91793330536f7d2e585ca1'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
