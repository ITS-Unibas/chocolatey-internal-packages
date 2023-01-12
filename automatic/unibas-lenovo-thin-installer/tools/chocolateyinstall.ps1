$ErrorActionPreference = 'Stop';

$packageName = 'unibas-lenovo-thin-installer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://download.lenovo.com/pccbbs/thinkvantage_en/lenovo_thininstaller_1.04.01.0004.exe'
  silentArgs     = '/VERYSILENT /NORESTART /LOG="C:\ProgramData\LANDESK\Log\Install_ThinInstaller.log"'
  softwareName   = 'unibas-lenovo-thin-installer*'
  checksum       = '6c68f8671388876d7e101d46666c3fce2fe00de6299bf024a0df04d6a5836b1e'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
