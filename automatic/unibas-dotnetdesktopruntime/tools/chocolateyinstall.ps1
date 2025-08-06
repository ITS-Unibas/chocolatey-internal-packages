$ErrorActionPreference = 'Stop';
 
$packageName = 'unibas-dotnetdesktopruntime'
 
$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/9.0.8/windowsdesktop-runtime-9.0.8-win-x64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
 
  softwareName   = 'unibas-dotnetdesktopruntime' 
  checksum       = 'c9473a9c3de6500597b7b7bb3ec82730027b6786034ba1b9115b79377d0233dd'
  checksumType   = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
