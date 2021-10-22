$ErrorActionPreference = 'Stop';

$packageName = 'unibas-lenovo-thin-installer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://download.lenovo.com/pccbbs/thinkvantage_en/lenovo_thininstaller_1.3.0031.exe'
  silentArgs     = '/VERYSILENT /NORESTART /LOG="C:\ProgramData\LANDESK\Log\Install_ThinInstaller.log"'
  softwareName   = 'unibas-lenovo-thin-installer*'
  checksum       = '26ef9d03f8fe5b5969f88478fdd454ffbcb50ad1a614b54c921ca0183463afd8'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
