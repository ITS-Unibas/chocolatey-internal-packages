
$ErrorActionPreference = 'Stop';


$packageName = 'omero.insight'
$LogPath = "$env:TEMP\"
#$Transforms = Join-Path $toolsdir "base.mst"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/ome/omero-insight/releases/download/v5.8.3/OMERO.insight-5.8.3.msi'
  silentArgs     = "/qn /norestart /l*v `"$($env:SWP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes = @(0, 3010, 1641)
  softwareName   = 'OMERO.Insight' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum       = 'db8fea24f478106a5141c454de63cf47496fd2975f6cfa4081f765da6d268a95'
  checksumType   = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs
