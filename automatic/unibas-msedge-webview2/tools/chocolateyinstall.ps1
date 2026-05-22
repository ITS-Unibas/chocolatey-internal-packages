$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/f7cb0b3e-1aa1-43fc-af27-ef73fd70d744/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = '17bf623316d69c4e096365d9ae589316fed446531d7e30ebc3e5abcaf582e603'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
