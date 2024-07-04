$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'VMWare Tools*'
  fileType       = 'EXE'
  url            = 'https://packages.vmware.com/tools/releases/latest/windows/x64/VMware-tools-12.4.5-23787635-x86_64.exe'
  checksum       = '0d277be897d95db40998e626883a77df564257134164a9cccc666d6588c01c33'
  checksumType   = 'sha256'
  silentArgs     = "/S /v `"/qn /l*v `"$env:SWP\Install_vmware-tools_$env:ChocolateyPackageVersion.log`" REBOOT=R`""
  validExitCodes = @(0, 3010)
}


Install-ChocolateyPackage @packageArgs
