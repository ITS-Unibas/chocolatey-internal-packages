﻿$ErrorActionPreference = 'Stop';

$packageName = 'unibas-eclipse'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2022-09/R/eclipse-jee-2022-09-R-win32-x86_64.zip&r=1'
  #OTHERS
  # Uncomment matching EXE type (sorted by most to least common)
  #silentArgs   = '/S'           # NSIS
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
  softwareName   = 'Eclipse*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum64     = 'f5010076a2e498a11997ab9cff3d6ea2805478ea5e2af86adade87bcb0f31ccc'
  checksumType64 = 'sha256' #default is checksumType
}

Install-ChocolateyZipPackage @packageArgs
