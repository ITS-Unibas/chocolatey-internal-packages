$ErrorActionPreference = 'Stop';
 
$packageName = 'unibas-dotnetdesktopruntime'
 
$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/9.0.6/windowsdesktop-runtime-9.0.6-win-x64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
 
  softwareName   = 'unibas-dotnetdesktopruntime' 
  checksum       = '3193bb08fa84cf1424965bfd2da3d21f2f850c55ff70dfe1c911bea7ceabb4fc'
  checksumType   = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
