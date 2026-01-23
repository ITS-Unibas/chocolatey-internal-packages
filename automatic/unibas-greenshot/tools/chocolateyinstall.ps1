$ErrorActionPreference = 'Stop';

$packageName = 'unibas-greenshot'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = 'https://github.com/greenshot/greenshot/releases/download/v1.3.312/Greenshot-INSTALLER-1.3.312-RELEASE.exe'
  #OTHERS
  # Uncomment matching EXE type (sorted by most to least common)
  silentArgs    = '/S'           # NSIS
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
  softwareName  = 'Greenshot*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum      = '64fd6d75ca1ec23b0aa1c48fbe071baea1c5e82303801a53b7d7b1c2456f8562'
  checksumType  = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs
