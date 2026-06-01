$ErrorActionPreference = 'Stop';

$packageName = 'unibas-qgis'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$LogPath = "$env:temp\"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url            = 'https://download.qgis.org/downloads/QGIS-OSGeo4W-3.44.11-1.msi'
  silentArgs     = "/qn /norestart /l*v `"$($LogPath)Install_$($env:chocolateyPackageName)_$($env:chocolateyPackageVersion).log`"" # Inno Setup
  validExitCodes = @(0, 3010) #please insert other valid exit codes here

  softwareName   = 'qgis*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum       = '062f58fd0f45fe94be2d9eda3316fc1d9109f2149f33bd1b15837d8dee0909c1'
  checksumType   = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs
