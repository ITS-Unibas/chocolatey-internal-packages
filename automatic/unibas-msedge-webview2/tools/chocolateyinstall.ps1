$ErrorActionPreference = 'Stop';

$packageName = 'unibas-msedge-webview2'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/f67cc405-2a0b-4df8-b641-023a0ee89f01/MicrosoftEdgeWebView2RuntimeInstallerX64.exe'
  silentArgs     = "/silent /install"
  validExitCodes = @(0)
  softwareName   = 'unibas-msedge-webview2*'
  checksum       = 'dc4449a7bde7ffa9deba2b14f7e207395cfcf33c6e112ca7f77fc966e91bf2ba'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
