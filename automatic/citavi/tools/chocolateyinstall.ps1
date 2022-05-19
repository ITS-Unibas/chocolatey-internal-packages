$ErrorActionPreference = 'Stop';

$packageName = 'citavi'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url64bit       = 'https://citavibackoffice.blob.core.windows.net/setup/Citavi6Setup.msi'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes = @(0, 3010, 1641)

  # optional, highly recommended
  softwareName   = 'Citavi*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum64     = '24367bde9121e5d22ebf63a550accd672c950ba44a746983a751c4c1211bf01a'
  checksumType64 = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs
