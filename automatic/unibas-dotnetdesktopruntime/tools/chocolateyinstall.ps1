$ErrorActionPreference = 'Stop';
 
$packageName = 'unibas-dotnetdesktopruntime'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$LogPath = "$env:SWP\"
 
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/51bc18ac-0594-412d-bd63-18ece4c91ac4/90b47b97c3bfe40a833791b166697e67/windowsdesktop-runtime-8.0.3-win-x64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
 
  # optional, highly recommended
  softwareName   = 'unibas-dotnetdesktopruntime' 
  checksum       = '4c41b24b8ca6c188abd126b09f16903c8902113b7a2763c32906f52a83b30aa4'
  checksumType   = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
