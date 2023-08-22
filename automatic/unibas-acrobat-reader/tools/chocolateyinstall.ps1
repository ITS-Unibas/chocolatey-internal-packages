$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'Adobe Acrobat DC Reader*'
  fileType       = 'EXE'
  url            = 'https://ardownload2.adobe.com/pub/adobe/reader/win/AcrobatDC/2300320284/AcroRdrDC2300320284_MUI.exe'
  checksum       = '47a0d8cc92f5c5e2b7a477fb3f427e68f6fd23bcf5092d3286de2f9f34c35606'
  checksumType   = 'sha256'
  silentArgs     = "/sAll /msi /norestart /quiet ALLUSERS=1 EULA_ACCEPT=YES DISABLEDESKTOPSHORTCUT=1 DISABLE_ARM_SERVICE_INSTALL=1 UPDATE_MODE=0 /L*v `"$env:TEMP\$env:chocolateyPackageName.$env:chocolateyPackageVersion.Install.log`""
  validExitCodes = @(0, 1000, 1101)
}

Install-ChocolateyPackage @packageArgs
