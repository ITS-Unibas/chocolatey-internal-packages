
$ErrorActionPreference = 'Stop';

$WindowsVersion=[Environment]::OSVersion.Version
if ($WindowsVersion.Major -ne "10") {
  throw "This package requires Windows 10."
}

$packageName = 'unibas-powertoys'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = ''
  url64bit       = ''
  #file         = $fileLocation

  #MSI
 #silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes = @(0)
  #OTHERS
  # Uncomment matching EXE type (sorted by most to least common)
  silentArgs   = '--silent'           # NSIS
  #silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' # Inno Setup
  #silentArgs   = '/s'           # InstallShield
  #silentArgs   = '/s /v"/qn"' # InstallShield with MSI
  #silentArgs   = '/s'           # Wise InstallMaster
  #silentArgs   = '-s'           # Squirrel
  #silentArgs   = '-q'           # Install4j
  #silentArgs   = '-s -u'        # Ghost
  # Note that some installers, in addition to the silentArgs above, may also need assistance of AHK to achieve silence.
  #silentArgs   = ''             # none; make silent with input macro script like AutoHotKey (AHK)
  #       https://chocolatey.org/packages/autohotkey.portable
  #validExitCodes= @(0) #please insert other valid exit codes here

  # optional, highly recommended
  softwareName   = 'unibas-powertoys*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum       = ''
  checksumType   = 'md5' #default is md5, can also be sha1
  checksum64     = ''
  checksumType64 = '' #default is checksumType
}



Install-ChocolateyPackage @packageArgs
