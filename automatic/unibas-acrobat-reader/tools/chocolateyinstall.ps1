$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'Adobe Acrobat DC Reader*'
  fileType       = 'EXE'
  url            = 'https://ardownload2.adobe.com/pub/adobe/reader/win/AcrobatDC/2400120643/AcroRdrDC2400120643_MUI.exe'
  checksum       = '3e8fc98216424f8929b1ee8de4e77971fa044f4d45441a5dd08dfa09ea818f7b'
  checksumType   = 'sha256'
  silentArgs     = "/sAll /msi /norestart /quiet ALLUSERS=1 EULA_ACCEPT=YES DISABLEDESKTOPSHORTCUT=1 DISABLE_ARM_SERVICE_INSTALL=1 UPDATE_MODE=0 /L*v `"$env:TEMP\$env:chocolateyPackageName.$env:chocolateyPackageVersion.Install.log`""
  validExitCodes = @(0, 1000, 1101)
}

Install-ChocolateyPackage @packageArgs
