$ErrorActionPreference = 'Stop';

$packageName = 'unibas-miktex'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://miktex.org/download/ctan/systems/win32/miktex/setup/windows-x64/basic-miktex-20.12-x64.exe'
  silentArgs     = '--no-registry --shared --unattended --local-package-repository=C:\Temp\MikTex\'
  softwareName   = 'miktex*'
  checksum64     = '6c3e099daae0de27b26d72f4a78c111510c988f173d77a42b8f49360609f5558'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
