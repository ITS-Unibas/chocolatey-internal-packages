$ErrorActionPreference = 'Stop';
 
$packageName = 'unibas-dotnetdesktopruntime'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$LogPath = "$env:SWP\"
 
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/0ff148e7-bbf6-48ed-bdb6-367f4c8ea14f/bd35d787171a1f0de7da6b57cc900ef5/windowsdesktop-runtime-8.0.5-win-x64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
 
  # optional, highly recommended
  softwareName   = 'unibas-dotnetdesktopruntime' 
  checksum       = '11eb55621f38c5f74b9731475d93cec5d558d66e433225509990c86b8094ce82'
  checksumType   = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
