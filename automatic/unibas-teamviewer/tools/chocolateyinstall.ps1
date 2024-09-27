$ErrorActionPreference = 'Stop';


$packageName = 'unibas-teamviewer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$LogPath = "$env:temp\"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = 'https://download.teamviewer.com/download/TeamViewer_Setup_x64.exe'
  silentArgs     = "/qn /norestart /l*v `"$($LogPath)Install_$($env:chocolateyPackageName)_$($env:chocolateyPackageVersion).log`"" # Inno Setup
  validExitCodes = @(0, 3010, 1605, 1614, 1641)
  softwareName   = 'unibas-teamviewer' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum       = '87b5be586bd03f9e2033a8f03fe852dbc697d267f7c6b2a4996b548b02bfc9c7'
  checksumType   = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs
