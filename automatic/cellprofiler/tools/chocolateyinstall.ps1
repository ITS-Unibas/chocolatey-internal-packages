
$ErrorActionPreference = 'Stop';


$packageName = 'cellprofiler'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://cellprofiler-releases.s3.amazonaws.com/CellProfiler-Windows-4.0.2.exe'
  #file         = $fileLocation

  #MSI
  #silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  #validExitCodes = @(0, 3010, 1641)
  #OTHERS
  # Uncomment matching EXE type (sorted by most to least common)
  silentArgs   = '/S'           # NSIS
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
  validExitCodes= @(0) #please insert other valid exit codes here

  # optional, highly recommended
  softwareName   = 'cellprofiler*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum       = 'cced2d649eb15bab327af1deea2601f761ea02757b010b72e2cb9dfb91795fbe'
  checksumType   = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs
