$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://keepass.info/filepool/KeePass-2.60-1.msi'
    checksum       = 'afb3fab5210fdfe36e5644351c94f336f53fcc4ddeedc0486b511d97ef06d109'
    checksumType   = 'sha256'
    fileType       = 'MSI'
    silentArgs     = '/qn'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
