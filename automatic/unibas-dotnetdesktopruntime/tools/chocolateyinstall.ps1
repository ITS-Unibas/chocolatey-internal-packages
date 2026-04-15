$ErrorActionPreference = 'Stop';
 
$packageName = 'unibas-dotnetdesktopruntime'
 
$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/10.0.6/windowsdesktop-runtime-10.0.6-win-x64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
 
  softwareName   = 'unibas-dotnetdesktopruntime' 
  checksum       = '5f3f75833f97e5bbcb701a664d09eb872a6dbccdd5b474c66fa2cccde2fc51cb'
  checksumType   = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
