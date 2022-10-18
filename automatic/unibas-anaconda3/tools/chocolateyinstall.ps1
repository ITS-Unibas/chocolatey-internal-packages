$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'Anaconda3'
  fileType       = 'EXE'
  url            = 'https://repo.continuum.io/archive/Anaconda3-2022.10-Windows-x86_64.exe'
  checksum       = '38b9d53a579843fe41fd05fd3c4f9ac3887f580e7bd9b43f220bbc3aea2367eb'
  checksumType   = 'sha256'
  silentArgs     = "/S /InstallationType=AllUsers /RegisterPython=1 /AddToPath=1 /D=C:\Program Files\Anaconda3"
  validExitCodes = @(0)
}

Write-Warning 'The Anaconda3 installation can take a long time (up to 30 minutes).'
Write-Warning 'Please be patient and let it finish.'
Write-Warning 'If you want to verify the install is running, you can watch the installer process in Task Manager'

Install-ChocolateyPackage @packageArgs
