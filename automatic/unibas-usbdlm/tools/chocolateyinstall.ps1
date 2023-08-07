$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'USB Drive Letter Manager*'
  fileType       = 'MSI'
  url            = 'https://www.uwe-sieber.de/files/usbdlm_x64.msi'
  checksum       = '40d57bc769a064045f3018904b5be1179cc26dd3fdb015f64e5130043f8b4a9f'
  checksumType   = 'sha256'
  silentArgs     = "/qn /norestart /l*v `"$env:SWP\Install_$env:ChocolateyPackageName_$env:ChocolateyPackageVersion.log`""
  validExitCodes = @(0, 3010)
}


Install-ChocolateyPackage @packageArgs
