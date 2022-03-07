$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'Adobe Acrobat DC Reader*'
  fileType       = 'EXE'
  url            = 'https://ardownload2.adobe.com/pub/adobe/reader/win/AcrobatDC/2200120085/AcroRdrDC2200120085_MUI.exe'
  checksum       = '2694ca516f3bb40b2a7b63a1c4605dd2a32dc07a8ba9c8b982bc82ec87d23c0c'
  checksumType   = 'sha256'
  silentArgs     = "/sAll /msi /norestart /quiet ALLUSERS=1 EULA_ACCEPT=YES DISABLEDESKTOPSHORTCUT=1 DISABLE_ARM_SERVICE_INSTALL=1 UPDATE_MODE=0 /L*v `"$env:TEMP\$env:chocolateyPackageName.$env:chocolateyPackageVersion.Install.log`""
  validExitCodes = @(0, 1000, 1101)
}

Install-ChocolateyPackage @packageArgs
