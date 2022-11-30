$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'VMWare Tools*'
  fileType       = 'EXE'
  url            = 'https://packages.vmware.com/tools/releases/latest/windows/x64/VMware-tools-12.1.5-20735119-x86_64.exe'
  checksum       = '2c1d6ef7ae17e57a5ae48d38951b1fe2f2f1eb7c7cdd05e3ab785c78b562e958'
  checksumType   = 'sha256'
  silentArgs     = "/S /v `"/qn /l*v `"$env:SWP\Install_vmware-tools_$env:ChocolateyPackageVersion.log`" REBOOT=R`""
  validExitCodes = @(0, 3010)
}


Install-ChocolateyPackage @packageArgs
