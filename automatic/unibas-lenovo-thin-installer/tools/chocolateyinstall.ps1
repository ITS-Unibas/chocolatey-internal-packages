$ErrorActionPreference = 'Stop';

$packageName = 'unibas-lenovo-thin-installer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://download.lenovo.com/pccbbs/thinkvantage_en/lenovo_thininstaller_1.3.0039.exe'
  silentArgs     = '/VERYSILENT /NORESTART /LOG="C:\ProgramData\LANDESK\Log\Install_ThinInstaller.log"'
  softwareName   = 'unibas-lenovo-thin-installer*'
  checksum       = 'bdf2cead8983c2cd3ac519e2a56b9756cd29604863187fc37026c9b553865909'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
