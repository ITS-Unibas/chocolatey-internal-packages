$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'USB Drive Letter Manager*'
  fileType       = 'MSI'
  url            = 'https://www.uwe-sieber.de/files/usbdlm_x64.msi'
  checksum       = '5f6d01dde7e259354f36dd134c6836bb9bc7e4219ccf089f02de5ad7b670c617'
  checksumType   = 'sha256'
  silentArgs     = "/qn /norestart /l*v `"$env:SWP\Install_$env:ChocolateyPackageName_$env:ChocolateyPackageVersion.log`""
  validExitCodes = @(0, 3010)
}


Install-ChocolateyPackage @packageArgs
