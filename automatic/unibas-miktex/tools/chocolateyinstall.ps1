$ErrorActionPreference = 'Stop';

$packageName = 'unibas-miktex'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://miktex.org/download/ctan/systems/win32/miktex/setup/windows-x64/basic-miktex-21.1-x64.exe'
  silentArgs     = '--no-registry --shared --unattended --local-package-repository=C:\Temp\MikTex\'
  softwareName   = 'miktex*'
  checksum64     = '6094e60920c31da14e9bcc56951572c79f05c3922f9192869df14aa80ed9cc31'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
