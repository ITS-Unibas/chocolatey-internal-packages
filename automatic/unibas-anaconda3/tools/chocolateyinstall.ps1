$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'Anaconda3'
  fileType       = 'EXE'
  url            = 'https://repo.continuum.io/archive/Anaconda3-2021.04-Windows-x86_64.exe'
  checksum       = '65fd8be6ab9aed8106bd1c9a228ecd7fd3e23d0d15b9d72415e3a884a69a8462'
  checksumType   = 'sha256'
  silentArgs     = "/S /InstallationType=AllUsers /RegisterPython=1 /AddToPath=1 /D=C:\Program Files\Anaconda3"
  validExitCodes = @(0)
}

Write-Warning 'The Anaconda3 installation can take a long time (up to 30 minutes).'
Write-Warning 'Please be patient and let it finish.'
Write-Warning 'If you want to verify the install is running, you can watch the installer process in Task Manager'

Install-ChocolateyPackage @packageArgs
