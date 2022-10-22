$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'Adobe Acrobat DC Reader*'
  fileType       = 'EXE'
  url            = 'https://ardownload2.adobe.com/pub/adobe/reader/win/AcrobatDC/2200320263/AcroRdrDC2200320263_MUI.exe'
  checksum       = 'abc327be5f0d62de60d4fda1d89637f8894bf32f218cdccbd6d4deebe60b91b2'
  checksumType   = 'sha256'
  silentArgs     = "/sAll /msi /norestart /quiet ALLUSERS=1 EULA_ACCEPT=YES DISABLEDESKTOPSHORTCUT=1 DISABLE_ARM_SERVICE_INSTALL=1 UPDATE_MODE=0 /L*v `"$env:TEMP\$env:chocolateyPackageName.$env:chocolateyPackageVersion.Install.log`""
  validExitCodes = @(0, 1000, 1101)
}

Install-ChocolateyPackage @packageArgs
