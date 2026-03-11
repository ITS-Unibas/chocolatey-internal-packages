$ErrorActionPreference = 'Stop';
 
$packageName = 'unibas-dotnetdesktopruntime'
 
$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/10.0.4/windowsdesktop-runtime-10.0.4-win-x64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
 
  softwareName   = 'unibas-dotnetdesktopruntime' 
  checksum       = 'dbb961ed3abe6aae81683f1568443245704fb5b334f31973cbeebcaabd1a67d3'
  checksumType   = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
