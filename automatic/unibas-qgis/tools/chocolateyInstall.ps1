$ErrorActionPreference = 'Stop';

$packageName = 'unibas-qgis'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$LogPath = "$env:temp\"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url            = 'https://download.qgis.org/downloads/QGIS-OSGeo4W-3.44.12-1.msi'
  silentArgs     = "/qn /norestart /l*v `"$($LogPath)Install_$($env:chocolateyPackageName)_$($env:chocolateyPackageVersion).log`"" # Inno Setup
  validExitCodes = @(0, 3010) #please insert other valid exit codes here

  softwareName   = 'qgis*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum       = '9138740d3dc691c20afd2151fa780afe36496df30fd9d2fa724d5a4efa46f270'
  checksumType   = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs
