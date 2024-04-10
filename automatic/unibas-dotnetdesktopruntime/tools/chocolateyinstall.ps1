$ErrorActionPreference = 'Stop';
 
$packageName = 'unibas-dotnetdesktopruntime'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$LogPath = "$env:SWP\"
 
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/c1d08a81-6e65-4065-b606-ed1127a954d3/14fe55b8a73ebba2b05432b162ab3aa8/windowsdesktop-runtime-8.0.4-win-x64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
 
  # optional, highly recommended
  softwareName   = 'unibas-dotnetdesktopruntime' 
  checksum       = '9e67dad8898790b8ad800283fb9323591c6e2409bd3b6536e29b18069ff818c1'
  checksumType   = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
