$ErrorActionPreference = 'Stop';

$packageName = 'unibas-lenovo-thin-installer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://download.lenovo.com/pccbbs/thinkvantage_en/lenovo_thininstaller_1.3.0043.exe'
  silentArgs     = '/VERYSILENT /NORESTART /LOG="C:\ProgramData\LANDESK\Log\Install_ThinInstaller.log"'
  softwareName   = 'unibas-lenovo-thin-installer*'
  checksum       = '87146ba9ae887f9fe6c0ad031b007896bebfbe66eda847cb4725500607a54a21'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
