$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'VMWare Tools*'
  fileType       = 'EXE'
  url            = 'https://packages.vmware.com/tools/releases/latest/windows/x64/VMware-tools-12.0.6-20104755-x86_64.exe'
  checksum       = '06f7d409448c342cae0c4e386af46896f68de8daaf81b1e9a37f0da914515ddf'
  checksumType   = 'sha256'
  silentArgs     = "/S /v `"/qn /l*v `"$env:SWP\Install_vmware-tools_$env:ChocolateyPackageVersion.log`" REBOOT=R`""
  validExitCodes = @(0, 3010)
}


Install-ChocolateyPackage @packageArgs
