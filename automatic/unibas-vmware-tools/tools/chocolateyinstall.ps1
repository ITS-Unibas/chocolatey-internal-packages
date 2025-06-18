$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'VMWare Tools*'
  fileType       = 'EXE'
  url            = 'https://packages.vmware.com/tools/releases/latest/windows/x64/VMware-tools-13.0.0-24696409-x64.exe'
  checksum       = 'deccd45bd6e641d88e31bc3b983e491ce0dc688575d2d03586bd9b4eefa1ccee'
  checksumType   = 'sha256'
  silentArgs     = "/S /v `"/qn /l*v `"$env:SWP\Install_vmware-tools_$env:ChocolateyPackageVersion.log`" REBOOT=R`""
  validExitCodes = @(0, 3010)
}


Install-ChocolateyPackage @packageArgs
