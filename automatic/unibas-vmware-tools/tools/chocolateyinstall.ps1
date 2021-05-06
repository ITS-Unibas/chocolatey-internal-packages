$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'VMWare Tools*'
  fileType       = 'EXE'
  url            = 'https://packages.vmware.com/tools/releases/latest/windows/x64/VMware-tools-11.2.6-17901274-x86_64.exe'
  checksum       = '86589b458fc0ceda787f4ac019db29da859d2b6b382d1f20ddd4e8226235fdde'
  checksumType   = 'sha256'
  silentArgs     = "/S /v `"/qn /l*v `"$env:SWP\Install_vmware-tools_$env:ChocolateyPackageVersion.log`" REBOOT=R`""
  validExitCodes = @(0, 3010)
}


Install-ChocolateyPackage @packageArgs
