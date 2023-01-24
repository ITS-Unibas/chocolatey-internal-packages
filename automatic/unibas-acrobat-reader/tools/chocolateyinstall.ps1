$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'Adobe Acrobat DC Reader*'
  fileType       = 'EXE'
  url            = 'https://ardownload2.adobe.com/pub/adobe/reader/win/AcrobatDC/2200320314/AcroRdrDC2200320314_MUI.exe'
  checksum       = '82e62f691b85f4486082e0a93c1297afce65dfee5075c2ee1047c2ec303490e7'
  checksumType   = 'sha256'
  silentArgs     = "/sAll /msi /norestart /quiet ALLUSERS=1 EULA_ACCEPT=YES DISABLEDESKTOPSHORTCUT=1 DISABLE_ARM_SERVICE_INSTALL=1 UPDATE_MODE=0 /L*v `"$env:TEMP\$env:chocolateyPackageName.$env:chocolateyPackageVersion.Install.log`""
  validExitCodes = @(0, 1000, 1101)
}

Install-ChocolateyPackage @packageArgs
