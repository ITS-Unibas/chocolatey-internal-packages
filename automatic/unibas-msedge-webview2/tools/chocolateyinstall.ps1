$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/e60f2ba9-1f3b-4e64-bb2f-537d61eb2466/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '873fcdedda1d20c2fefaf02b7c4b0c48eff0a21c1ea729c385d156dfa209081f'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
