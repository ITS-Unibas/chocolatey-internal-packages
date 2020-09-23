
$ErrorActionPreference = 'Stop';


$packageName = 'xming-fonts'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://sourceforge.net/projects/xming/files/Xming-fonts/7.7.0.10/Xming-fonts-7-7-0-10-setup.exe/download'
  silentArgs     = "/VERYSILENT /ALLUSERS /NOCANCEL /NORESTART /LOG=`"$($env:SWP)\Install_$($packageName).$($env:chocolateyPackageVersion).log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes = @(0, 3010, 1641)

  softwareName   = 'Xming-fonts*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum       = 'ACF5507D51C680A5BAED212334412CA97BBFA67D7E161B6347FC9194EC22D9B1'
  checksumType   = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs
