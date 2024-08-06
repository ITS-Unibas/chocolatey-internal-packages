$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
# Old Techsmith software versions can be found at https://www.techsmith.com/download/oldversions
$url64 = 'https://download.techsmith.com/snagit/releases/2420/snagit.msi'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'MSI'
    url64bit       = $Url64

    checksum64     = 'f2c5a13426ba2eeca7296a7aa24ada4752c3c213ac67b3b924fb7c6459389f5d'
    checksumType64 = 'sha256'

    silentArgs     = "/quiet /passive /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
