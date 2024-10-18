$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/c0f61e34-0dbb-415d-8d20-a7d8e940e6ba/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '3d4eff33af9fb2df853d1681c2e4e633968b6b6bf16e125f6b0584a876193550'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
