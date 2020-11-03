
$ErrorActionPreference = 'Stop';


$packageName = 'unibas-infrarecorder'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url            = 'https://sourceforge.net/projects/infrarecorder/files/InfraRecorder/0.53/ir053_x64.msi/download'
  silentArgs     = '/quiet /norestart' # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes = @(0, 3010, 1641)

  softwareName   = 'InfraRecorder*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum       = '332704763605252EF9E88D2A8CE6D076719F0ACB307DB231069483AE5CA407FF'
  checksumType   = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs
