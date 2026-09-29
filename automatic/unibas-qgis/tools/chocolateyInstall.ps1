$ErrorActionPreference = 'Stop';

$packageName = 'unibas-qgis'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$LogPath = "$env:temp\"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url            = 'https://download.qgis.org/downloads/QGIS-OSGeo4W-3.44.15-1.msi'
  silentArgs     = "/qn /norestart /l*v `"$($LogPath)Install_$($env:chocolateyPackageName)_$($env:chocolateyPackageVersion).log`"" # Inno Setup
  validExitCodes = @(0, 3010) #please insert other valid exit codes here

  softwareName   = 'qgis*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum       = 'eb980a4b84e4a040d872daa025520a2457292d6754c4641b6a26734c3c4fc02a'
  checksumType   = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs
