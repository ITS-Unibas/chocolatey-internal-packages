$ErrorActionPreference = 'Stop';

$packageName = 'unibas-miktex'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://miktex.org/download/ctan/systems/win32/miktex/setup/windows-x64/basic-miktex-20.10-x64.exe'
  silentArgs     = '--no-registry --shared --unattended --local-package-repository=C:\Temp\MikTex\'
  softwareName   = 'miktex*'
  checksum64     = 'cb9434d9ba0cedb480500f9bdfe437cd08fb57583704cabab5697e53bfba610b'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
