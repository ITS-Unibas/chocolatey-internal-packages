﻿
$ErrorActionPreference = 'Stop';


$packageName = 'unibas-audacity'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://github.com/audacity/audacity/releases/download/Audacity-3.3.1/audacity-win-3.3.1-x64.exe'
  #OTHERS
  # Uncomment matching EXE type (sorted by most to least common)
  #silentArgs   = '/S'           # NSIS
  silentArgs     = '/VERYSILENT' # Inno Setup
  #silentArgs   = '/s'           # InstallShield
  #silentArgs   = '/s /v"/qn"' # InstallShield with MSI
  #silentArgs   = '/s'           # Wise InstallMaster
  #silentArgs   = '-s'           # Squirrel
  #silentArgs   = '-q'           # Install4j
  #silentArgs   = '-s -u'        # Ghost
  # Note that some installers, in addition to the silentArgs above, may also need assistance of AHK to achieve silence.
  #silentArgs   = ''             # none; make silent with input macro script like AutoHotKey (AHK)
  #       https://chocolatey.org/packages/autohotkey.portable
  validExitCodes = @(0) #please insert other valid exit codes here

  # optional, highly recommended
  softwareName   = 'Audacity' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum       = '296552cff05905339069e3750697a2418e44eb0953ae0602eb2417ac67e9f701'
  checksumType   = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs
