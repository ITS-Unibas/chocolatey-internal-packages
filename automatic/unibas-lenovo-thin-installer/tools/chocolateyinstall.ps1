$ErrorActionPreference = 'Stop';

$packageName = 'unibas-lenovo-thin-installer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://download.lenovo.com/pccbbs/thinkvantage_en/lenovo_thininstaller_1.04.02.00024.exe'
  silentArgs     = '/VERYSILENT /NORESTART /LOG="C:\ProgramData\LANDESK\Log\Install_ThinInstaller.log"'
  softwareName   = 'unibas-lenovo-thin-installer*'
  checksum       = '3f35fddfd07701caf95fc60eb488e26a73a1e27bb4beaed1afdf3982d871e234'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
