$ErrorActionPreference = 'Stop';

$packageName = 'unibas-miktex'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://miktex.org/download/ctan/systems/win32/miktex/setup/windows-x64/basic-miktex-23.4-x64.exe'
  silentArgs     = '--no-registry --shared --unattended --local-package-repository=C:\Temp\MikTex\'
  softwareName   = 'miktex*'
  checksum64     = '008e754d1c7816687d0fd64458922fc2d188aab4c10a53481158b42d20be5cb3'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
