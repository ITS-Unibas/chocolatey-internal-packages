$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/c87ab52b-58dc-43aa-af33-18027df5b456/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'bdcf41e7628ee44b411c1c600735cbeb0d93412c4af1ad08b1f0dc3c40183b30'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
