$ErrorActionPreference = 'Stop';

$packageName = 'pymol'
$url = 'https://storage.googleapis.com/pymol-storage/installers/PyMOL-3.1.9-Windows-x86_64.exe'

$packageArgs = @{
  packageName    = $packageName
  url            = $url
  softwareName   = 'PyMOL*'
  fileType       = 'exe'
  checksum       = 'c36fe9b4dff44e286f72a3119dbb362bd97c892ecd9db2e14408ecb74f325442'
  checksumType   = 'sha256' 
  silentArgs     = "/S /InstallationType=AllUsers"
}

Install-ChocolateyPackage @packageArgs
