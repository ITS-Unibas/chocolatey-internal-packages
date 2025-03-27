$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/52f6414d-5a3b-4a35-bc9e-1a5455b98137/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '63ad4d3739932e9a4626bdf2da48232d220725b58edc20faf5da867132faa8b6'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
