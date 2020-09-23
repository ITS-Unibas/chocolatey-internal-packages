
$ErrorActionPreference = 'Stop';


$packageName = 'xming'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://sourceforge.net/projects/xming/files/Xming/6.9.0.31/Xming-6-9-0-31-setup.exe/download'
  silentArgs     = "/VERYSILENT /ALLUSERS /NOCANCEL /NORESTART /LOG=`"$($env:SWP)\Install_$($packageName).$($env:chocolateyPackageVersion).log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes = @(0, 3010, 1641)

  softwareName   = 'Xming*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum       = '9FE52242D63D90C5BF4859B9DE46F516C54B80BF8E94939A4986667ACF6C5024'
  checksumType   = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs
