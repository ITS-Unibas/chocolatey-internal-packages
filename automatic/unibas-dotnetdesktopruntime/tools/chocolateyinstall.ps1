$ErrorActionPreference = 'Stop';
 
$packageName = 'unibas-dotnetdesktopruntime'
 
$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/10.0.3/windowsdesktop-runtime-10.0.3-win-x64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
 
  softwareName   = 'unibas-dotnetdesktopruntime' 
  checksum       = '48bac209f52eb48652b349ba0347ca51dcf6f3d1f53d9126880ee650692b8f11'
  checksumType   = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
