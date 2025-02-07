$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/33baa70e-4c22-4041-a961-588e61bdd462/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '134c6b4238393cc31cb0b1548eada1cf6f27a2a28a45f25de2299c7ec4708896'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
